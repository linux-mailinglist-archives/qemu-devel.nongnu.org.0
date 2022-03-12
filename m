Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094AC4D6F99
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 15:53:39 +0100 (CET)
Received: from localhost ([::1]:53658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT37h-0003nI-HI
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 09:53:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT36V-00032G-IB
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:52:23 -0500
Received: from [2607:f8b0:4864:20::529] (port=46026
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT36T-0001sG-OS
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:52:23 -0500
Received: by mail-pg1-x529.google.com with SMTP id z4so9911773pgh.12
 for <qemu-devel@nongnu.org>; Sat, 12 Mar 2022 06:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GeHmD17dLFS0N1V5x70G+Pw0zg95vgPW65PwljqjAyM=;
 b=B1rEFreCkfzxl593XjtcJHikIB1MyuckPOk37txaw5WmWRHDrtL6Pmc7Qw7O/HJqMc
 YSdYta8S0vARPz8aoj5Ond2T4mC8vGqmKFzQ6E5rScoFbE+HztDXsOoZT7dor62j1elL
 rqId11ncJQiCpYtkQiBAuCCCG3PZgXcDrW20gbKUmC0wBad+ATzYZZNJS39MvznL3RH0
 bcDo3N1Dh5tnRroX9JkusypDy1mvTRUhQ9Q/hlJSTTRfSKuGsRamuCk/o58MyBNszN+1
 pYsV7CEG7n/nPFLffrUiye9RobLFreV3z4aBbatglYRy7miBdESR4jOoWcAAxUrwZ6rH
 u4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GeHmD17dLFS0N1V5x70G+Pw0zg95vgPW65PwljqjAyM=;
 b=gsnATle6lI/4l5K8g79MmPjafwGbc6ZRnw9sk/6+fF0CQLLsEFzAZRtOeMqM1CXMrU
 zzYXXTfq2Sv/60yF968bZdU+jhxqkxxAwUR82CgArdMxQWit4ZwuXIDaXb66+Zc551zL
 fwm3x+AM2h4QOk60fM0qxxdlcyYDkZTm5UlKAqF56Aiod2CwVFsKcwiX44wXXcNMcDAI
 BU+Qx5EzFUTGz2KetzLRrOVhPAaz6qSC/GHBRKNY3B3ESgiIYn2AIQ9CMbDyPFLSCjci
 iTy0f2MeqUXfGkJV4WbPEGf6SVktw0p58DJvFoQhMfcmATHINiLCUh0FuNdUprhrgi0l
 Y3XA==
X-Gm-Message-State: AOAM53283QLr5ptpn6MAV2B9ofKryA73JdDz53Co2KYny0o7PK1Ia2vL
 RQsXP09R8LIwAJJ3SoI3zemJcw==
X-Google-Smtp-Source: ABdhPJzHgHadQnS1hSeemZAzIY7XpC8ZWwjQzTSGwz5MpqfvMYtd/BByGkpggUQCh3o4IzdKoBlu/Q==
X-Received: by 2002:a65:49c7:0:b0:374:4ee8:ab5e with SMTP id
 t7-20020a6549c7000000b003744ee8ab5emr12994352pgs.344.1647096740049; 
 Sat, 12 Mar 2022 06:52:20 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a056a00004b00b004f6907b2cd3sm14490284pfk.122.2022.03.12.06.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 06:52:19 -0800 (PST)
Message-ID: <0beae502-07b2-481a-3437-bbecc8a99a58@linaro.org>
Date: Sat, 12 Mar 2022 06:52:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] s390x: pv: Add dump support
Content-Language: en-US
To: Janosch Frank <frankja@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220310112547.3823-1-frankja@linux.ibm.com>
 <20220310112547.3823-6-frankja@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220310112547.3823-6-frankja@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, imbrenda@linux.ibm.com, cohuck@redhat.com,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org, mhartmay@linux.ibm.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/22 03:25, Janosch Frank wrote:
> Sometimes dumping a guest from the outside is the only way to get the
> data that is needed. This can be the case if a dumping mechanism like
> KDUMP hasn't been configured or data needs to be fetched at a specific
> point. Dumping a protected guest from the outside without help from
> fw/hw doesn't yield sufficient data to be useful. Hence we now
> introduce PV dump support.
> 
> The PV dump support works by integrating the firmware into the dump
> process. New Ultravisor calls are used to initiate the dump process,
> dump cpu data, dump memory state and lastly complete the dump process.
> The UV calls are exposed by KVM via the new KVM_PV_DUMP command and
> its subcommands. The guest's data is fully encrypted and can only be
> decrypted by the entity that owns the customer communication key for
> the dumped guest. Also dumping needs to be allowed via a flag in the
> SE header.
> 
> On the QEMU side of things we store the PV dump data in the newly
> introduced architecture ELF sections (storage state and completion
> data) and the cpu notes (for cpu dump data).
> 
> Users can use a tool to convert the encrypted QEMU dump to an
> unencrypted one.
> 
> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
> ---
>   dump/dump.c              |  27 -----
>   include/elf.h            |   1 +
>   include/sysemu/dump.h    |  27 +++++
>   target/s390x/arch_dump.c | 247 ++++++++++++++++++++++++++++++++++-----
>   4 files changed, 244 insertions(+), 58 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index a9d9ea514d..4b7d333866 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -708,33 +708,6 @@ static void dump_begin(DumpState *s, Error **errp)
>       write_elf_notes(s, errp);
>   }
>   
> -static int get_next_block(DumpState *s, GuestPhysBlock *block)
> -{
> -    while (1) {
> -        block = QTAILQ_NEXT(block, next);
> -        if (!block) {
> -            /* no more block */
> -            return 1;
> -        }
> -
> -        s->start = 0;
> -        s->next_block = block;
> -        if (s->has_filter) {
> -            if (block->target_start >= s->begin + s->length ||
> -                block->target_end <= s->begin) {
> -                /* This block is out of the range */
> -                continue;
> -            }
> -
> -            if (s->begin > block->target_start) {
> -                s->start = s->begin - block->target_start;
> -            }
> -        }
> -
> -        return 0;
> -    }
> -}

No reason to make this inline, surely.  Just export it.
Anyway, this should be it's own patch.

> @@ -76,9 +77,12 @@ typedef struct noteStruct {
>           uint64_t todcmp;
>           uint32_t todpreg;
>           uint64_t ctrs[16];
> +        uint8_t dynamic;  /* Real size comes from PV info interface */

This needs a better comment.  Possibly

     uint8_t dynamic[1];  /* Would be a flexible array member, if that was legal inside a 
union. Real size comes from PV info interface. */

Alternately, rewrite everything to work with

typedef struct noteStruct {
     Elf64_Nhdr hdr;
     char name[8];
     uint8_t contents[];
} QEMU_PACKED Note;

which is a better description of what's going on in this file anyway.


r~

