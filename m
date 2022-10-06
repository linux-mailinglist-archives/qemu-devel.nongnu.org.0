Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9A45F6D7B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 20:27:19 +0200 (CEST)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogVaY-0005Hn-9A
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 14:27:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV8I-0000a0-W4
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:58:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ogV8G-0005sP-3z
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 13:58:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665079083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9mcAc3X1k/KWDSmUQY7SI8xwQu9jH6Q5Ej6Wl9s2CY=;
 b=MmE1OtQ5FpTm8gJSLuC4/MI5Vsh9YTr/4rhiRFHm/EsDuKmbkvG9Zv+dpQ+uHFKJ9spHEP
 h3LxUyf1vgn4Ex7OVmfXSUUVcEJcgxlhmnK3I+croes/uA2/YcY9lv5ip+RGj3Ev2C/KZN
 6iJATMeArBXqUbbxcCavZW8UOFdfDQk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-636-ELW6I8qTOIaB4PHU3iLW3A-1; Thu, 06 Oct 2022 13:58:02 -0400
X-MC-Unique: ELW6I8qTOIaB4PHU3iLW3A-1
Received: by mail-wm1-f72.google.com with SMTP id
 h129-20020a1c2187000000b003be5419a7e4so742004wmh.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 10:58:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=v9mcAc3X1k/KWDSmUQY7SI8xwQu9jH6Q5Ej6Wl9s2CY=;
 b=Y0jvhExH0sIxJBXO73eUJPgIBVUQO0+rEuKmqtll9Whk8Vp06DZHjwPQFt2aJLnCTj
 OqS//qc/EupnToUQ57buirqSyAX5aTl9s25Qw+VdY6s5AyHDMuBLt+J8OV/oSXZf6bfE
 X6crj9D9qypYISlde0KDWv8cmBiXQ/gYowwOwKzqgU4hh7k+vcSECZQgu226nyn3WvGs
 dAndJFfRB80KYOFypobyBAa4T2NO7z2gQzIwkE8ushgCR9o6s2LXsQEay8vKOu2VK0OO
 QLtiA4hnyXI8i4za8dFJ+ux+d92vI/eRdgFLJZfjkYmQ1LPIBM4X7NfRW6/9JZqc66an
 dSQA==
X-Gm-Message-State: ACrzQf2CC+sX8mN7W/ZuRXvFvZxivbmRg8ZMHHNJ8C2lra44WJZzR6nA
 x0fIT5A9kVyGcs0q6MbjM/2kwgYhLt+UH6cyb37EYzLotsSB8PpfvasMFXjUZUO/0jf5oPyiTx6
 ddcrVDR9dq1K5hGA=
X-Received: by 2002:a05:600c:510e:b0:3b5:1ab:fa5 with SMTP id
 o14-20020a05600c510e00b003b501ab0fa5mr7805895wms.204.1665079080893; 
 Thu, 06 Oct 2022 10:58:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6mt/0LNuRJfIf5wTeQEM7CaXfB4pbK8JallrArolCTYJg74+MWWKzXf4jlv3VOdbhIdvZkxw==
X-Received: by 2002:a05:600c:510e:b0:3b5:1ab:fa5 with SMTP id
 o14-20020a05600c510e00b003b501ab0fa5mr7805887wms.204.1665079080722; 
 Thu, 06 Oct 2022 10:58:00 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b003c1a7ea3736sm100128wmq.11.2022.10.06.10.57.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:58:00 -0700 (PDT)
Date: Thu, 6 Oct 2022 18:57:58 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH 14/14] migration: Drop rs->f
Message-ID: <Yz8XJgpshMNtH8y7@work-vm>
References: <20220920225106.48451-1-peterx@redhat.com>
 <20220920225229.49212-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920225229.49212-1-peterx@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Xu (peterx@redhat.com) wrote:
> Now with rs->pss we can already cache channels in pss->pss_channels.  That
> pss_channel contains more infromation than rs->f because it's per-channel.
> So rs->f could be replaced by rss->pss[RAM_CHANNEL_PRECOPY].pss_channel,
> while rs->f itself is a bit vague now.
> 
> Note that vanilla postcopy still send pages via pss[RAM_CHANNEL_PRECOPY],
> that's slightly confusing but it reflects the reality.
> 
> Then, after the replacement we can safely drop rs->f.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index f42efe02fc..03bf2324ab 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -345,8 +345,6 @@ struct RAMSrcPageRequest {
>  
>  /* State of RAM for migration */
>  struct RAMState {
> -    /* QEMUFile used for this migration */
> -    QEMUFile *f;
>      /*
>       * PageSearchStatus structures for the channels when send pages.
>       * Protected by the bitmap_mutex.
> @@ -2555,8 +2553,6 @@ static int ram_find_and_save_block(RAMState *rs)
>          }
>  
>          if (found) {
> -            /* Cache rs->f in pss_channel (TODO: remove rs->f) */
> -            pss->pss_channel = rs->f;
>              pages = ram_save_host_page(rs, pss);
>          }
>      } while (!pages && again);
> @@ -3112,7 +3108,7 @@ static void ram_state_resume_prepare(RAMState *rs, QEMUFile *out)
>      ram_state_reset(rs);
>  
>      /* Update RAMState cache of output QEMUFile */
> -    rs->f = out;
> +    rs->pss[RAM_CHANNEL_PRECOPY].pss_channel = out;
>  
>      trace_ram_state_resume_prepare(pages);
>  }
> @@ -3203,7 +3199,7 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>              return -1;
>          }
>      }
> -    (*rsp)->f = f;
> +    (*rsp)->pss[RAM_CHANNEL_PRECOPY].pss_channel = f;
>  
>      WITH_RCU_READ_LOCK_GUARD() {
>          qemu_put_be64(f, ram_bytes_total_common(true) | RAM_SAVE_FLAG_MEM_SIZE);
> @@ -3338,7 +3334,7 @@ static int ram_save_iterate(QEMUFile *f, void *opaque)
>  out:
>      if (ret >= 0
>          && migration_is_setup_or_active(migrate_get_current()->state)) {
> -        ret = multifd_send_sync_main(rs->f);
> +        ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
>          if (ret < 0) {
>              return ret;
>          }
> @@ -3406,7 +3402,7 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
>          return ret;
>      }
>  
> -    ret = multifd_send_sync_main(rs->f);
> +    ret = multifd_send_sync_main(rs->pss[RAM_CHANNEL_PRECOPY].pss_channel);
>      if (ret < 0) {
>          return ret;
>      }
> -- 
> 2.32.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


