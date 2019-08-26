Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F35A59D00E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 15:07:12 +0200 (CEST)
Received: from localhost ([::1]:52688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2EiF-0002pa-IX
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 09:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58817)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.weiyang@gmail.com>) id 1i2Egu-0002LM-Eu
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.weiyang@gmail.com>) id 1i2Egt-00011e-4z
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:05:48 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:44031)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.weiyang@gmail.com>)
 id 1i2Egs-00011E-TR
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 09:05:47 -0400
Received: by mail-ed1-x541.google.com with SMTP id h13so26370897edq.10
 for <qemu-devel@nongnu.org>; Mon, 26 Aug 2019 06:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7lA60f3oGIv9vJtV4Jn0HNi1bGdOdlQxFrnKj1/vQ+M=;
 b=By1aCrCFD2NKMfnpjpU9cqsoGFufOyMDsfiwZIwz9gQHrbPTJgTMorWeSDQcgmKptL
 n1s79IkXJ2Qfclum2GFfq720wcwXxILS5P9Gb2Bu0qSgC0cvNuLfalWkX18tihYkp+nZ
 PAfRtN8hyoFe3GGnyBf7nYwHrn/T4gv+dS+OBzLV9z4OpWgxx9qxAO1WlUrv3N8R5gBg
 D7K9iA2XXJn+Pl5CHPlTqSjWy0Xajb2nObGm1pTbjxamWVNYia0aoMbLp1w9aaFrLIJU
 zcQJohJzN1u9nvzX3ahEy2sEuskUfY3dRmLZPbCYKXy69Ofs7s8hfzavzClTN+8qRygF
 okhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7lA60f3oGIv9vJtV4Jn0HNi1bGdOdlQxFrnKj1/vQ+M=;
 b=oLlbjUoMV0IOzvrfKAiKhvnDlmcEcIkUH9uYg8nYK9jWOrWKc/gFXvq81Ty1pwHWCu
 uQRz+Gt3UMts9VKrl3G43MGLOh5HzJNXUQUXmbyXwmWLPv7utUVEcSylYFofrCtPOEER
 rDpuhcdncppisYHapSAcqjxHw8/00kHojUf6itS1XKBQkNWn1btZl7wQqk2+qcM7Eb5k
 dLFbuCYmARQT8oIqZs3QwChds87oglzwToi7iI3aM08h/KSrjB8oOWock41W0Alk8ecV
 v+4FCA5vJxHNP8ESCX1eyYm55A3ciqU87MaYqwXmVb2aDmqU0sEpXHDwbR/W7Kwi0LAO
 71Rw==
X-Gm-Message-State: APjAAAWF2GeXtdvSsyBwdElM0UOylhwgYN7Xg0qYMWpPpEgjGCr/aiwh
 +pUljqUw2VTF+8Kl4258ou8=
X-Google-Smtp-Source: APXvYqy5QHl+y4Te4hIgbYuXoD3kOzHDYJ5r+/W8wkCmV0J7vQNdzrv3i/Lh+enyFcdfeqS7rh3Z4Q==
X-Received: by 2002:a50:a7c2:: with SMTP id i60mr18468032edc.215.1566824745813; 
 Mon, 26 Aug 2019 06:05:45 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id v6sm2921424ejx.28.2019.08.26.06.05.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 26 Aug 2019 06:05:45 -0700 (PDT)
Date: Mon, 26 Aug 2019 13:05:44 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Message-ID: <20190826130544.bsypypma2mcqocyy@master>
References: <20190802060359.16556-1-richardw.yang@linux.intel.com>
 <20190823155919.GO2784@work-vm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823155919.GO2784@work-vm>
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::541
Subject: Re: [Qemu-devel] [RFC PATCH] migration/postcopy: enable compress
 with postcopy
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: quintela@redhat.com, Wei Yang <richardw.yang@linux.intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 23, 2019 at 04:59:19PM +0100, Dr. David Alan Gilbert wrote:
>* Wei Yang (richardw.yang@linux.intel.com) wrote:
>> This patch enable compress with postcopy.
>> 
>> This is a RFC and based on some unmerged patch
>> 
>>   "migration: extract ram_load_precopy"
>>   "migration/postcopy: skip compression when postcopy is active"
>> 
>> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>> ---
>>  migration/postcopy-ram.c |  3 +--
>>  migration/ram.c          | 35 +++++++++++++++++++++--------------
>>  2 files changed, 22 insertions(+), 16 deletions(-)
>> 
>> diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
>> index a7e7ec9c22..70b6beb5a9 100644
>> --- a/migration/postcopy-ram.c
>> +++ b/migration/postcopy-ram.c
>> @@ -1252,8 +1252,7 @@ int postcopy_place_page_zero(MigrationIncomingState *mis, void *host,
>>              }
>>              memset(mis->postcopy_tmp_zero_page, '\0', mis->largest_page_size);
>>          }
>> -        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page,
>> -                                   rb);
>> +        return postcopy_place_page(mis, host, mis->postcopy_tmp_zero_page, rb);
>
>Please keep these type of cleanups separate.
>
>>      }
>>  }
>>  
>> diff --git a/migration/ram.c b/migration/ram.c
>> index a0d3bc60b2..c1d6eadf38 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2384,16 +2384,6 @@ static bool save_page_use_compression(RAMState *rs)
>>          return false;
>>      }
>>  
>> -    /*
>> -     * The decompression threads asynchronously write into RAM
>> -     * rather than use the atomic copies needed to avoid
>> -     * userfaulting.  It should be possible to fix the decompression
>> -     * threads for compatibility in future.
>> -     */
>> -    if (migration_in_postcopy()) {
>> -        return false;
>> -    }
>> -
>>      /*
>>       * If xbzrle is on, stop using the data compression after first
>>       * round of migration even if compression is enabled. In theory,
>> @@ -3433,6 +3423,11 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>>          }
>>          i++;
>>      }
>> +
>> +    if (migrate_postcopy_ram()) {
>> +        flush_compressed_data(rs);
>> +    }
>> +
>>      rcu_read_unlock();
>>  
>>      /*
>> @@ -4019,6 +4014,7 @@ static int ram_load_postcopy(QEMUFile *f)
>>          void *place_source = NULL;
>>          RAMBlock *block = NULL;
>>          uint8_t ch;
>> +        int len;
>>  
>>          addr = qemu_get_be64(f);
>>  
>> @@ -4036,7 +4032,8 @@ static int ram_load_postcopy(QEMUFile *f)
>>  
>>          trace_ram_load_postcopy_loop((uint64_t)addr, flags);
>>          place_needed = false;
>> -        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
>> +        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
>> +                     RAM_SAVE_FLAG_COMPRESS_PAGE)) {
>>              block = ram_block_from_stream(f, flags);
>>  
>>              host = host_from_ram_block_offset(block, addr);
>> @@ -4109,6 +4106,17 @@ static int ram_load_postcopy(QEMUFile *f)
>>                                           TARGET_PAGE_SIZE);
>>              }
>>              break;
>> +        case RAM_SAVE_FLAG_COMPRESS_PAGE:
>> +            all_zero = false;
>> +            len = qemu_get_be32(f);
>> +            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
>> +                error_report("Invalid compressed data length: %d", len);
>> +                ret = -EINVAL;
>> +                break;
>> +            }
>> +            decompress_data_with_multi_threads(f, page_buffer, len);
>> +            ret |= wait_for_decompress_done();
>
>I think this might work for a 4k page host; but I'm not sure it's
>safe on hugepages or ARM/Power where they have bigger pages.
>ram_load_postcopy relies on all of the pages within a single hostpage
>arriving before the last subpage and that's what then triggers the call
>to postcopy_place_page;  that relies on some ordering - but I don't
>think that the multiple compress threads on the source have any ordering
>between the threads - or am I missing something about how the multiple
>threads are organised?
>

Thanks for your comment. I think you are right. It's me who miss this
situation.

One quick fix for this problem is to leverage save_compress_page to do the
flush before it compress another page. But this would lose the multi-thread
capability.

The other way is to have a similar "buf" like the receiving side to hold the
compressed page and send it after all threads finish compressing.

BTW, is multifd have this in order? Looks we can have multifd with postcopy?

-- 
Wei Yang
Help you, Help me

