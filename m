Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073425B997B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 13:22:02 +0200 (CEST)
Received: from localhost ([::1]:52724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYmwS-0003mI-LR
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 07:22:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYmut-00024N-Nd
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:20:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYmup-00072Y-AT
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 07:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663240818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X2A89qUt9k1eVlTo0J4woTB0AtjK6aoqdBMp0/a77N0=;
 b=BcW1SgP0jSLorIbJ03I4KOrhoR5CE0SrtUnS5b3uIqpB+OaMBy+IMWilj8WeY7874RPN4O
 CEU8UU3Tm9yoORKiOskdEXpnJAclGlUJOWIipH6hdnl+pPrRXtUmpExw8eimzSffj0LTEt
 tNnETA2NV2tNxZq0cAPkD5QYCTmu6vM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-106-aiD1XAL5M36XEdfPg9Cccg-1; Thu, 15 Sep 2022 07:20:14 -0400
X-MC-Unique: aiD1XAL5M36XEdfPg9Cccg-1
Received: by mail-wm1-f70.google.com with SMTP id
 j19-20020a05600c1c1300b003ab73e4c45dso12567967wms.0
 for <qemu-devel@nongnu.org>; Thu, 15 Sep 2022 04:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=X2A89qUt9k1eVlTo0J4woTB0AtjK6aoqdBMp0/a77N0=;
 b=dJ+nNFaGkkLqpl7Ou6SX7KNcz811+XGxNqMmhwkCyeyWwPHV6/XmkPFz78iUI1I+WV
 DTaYFw7GikO3EBYNju2BIktkf07VN45ARTkvNv731S4FEIEaMEzn/C/cZ67Vh1SMvY/D
 Kwj3syQJZ8eMyIL5NlKPkOh71CDeZUxrLP64wjiR9a6Rb4DbITsu56ML8IAuvfnUSXZ0
 d0y8MFtk2Q50ZHcvVbdI36p7BDh7RQ5CKCBevMZmSQlbPxN1M3VFSVgs/qEgGYCVbru3
 KmCFFfxEqfkXms1lN5z9wqx1B2xfBJ9OIiptKoaB/v6oypS9PS4mPubkrazO1DYHh74B
 yDtg==
X-Gm-Message-State: ACgBeo27e2u8jX+aje9tb6DEGQTx/zKqeBFQ0ILDpjcozjxanfe0pxbE
 952wekfJw1fjP07lP68Dl2X2Y7/QC/GW65pQzp8PuxQdhNB51Sv3S35GLmQhpHRKI+/YoliFgke
 aU63hI6uiVuZA6Po=
X-Received: by 2002:a05:600c:255:b0:3aa:2150:b184 with SMTP id
 21-20020a05600c025500b003aa2150b184mr6374384wmj.138.1663240813779; 
 Thu, 15 Sep 2022 04:20:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6P+YxEjNVL1mc6xU/Hn79S8gle4be+HDxvTqLZ8j2cSQa3Xa5nmtyEoffSNaIYWPuYBXOy+g==
X-Received: by 2002:a05:600c:255:b0:3aa:2150:b184 with SMTP id
 21-20020a05600c025500b003aa2150b184mr6374368wmj.138.1663240813482; 
 Thu, 15 Sep 2022 04:20:13 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 j5-20020a5d4485000000b002205cbc1c74sm2335324wrq.101.2022.09.15.04.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 04:20:13 -0700 (PDT)
Date: Thu, 15 Sep 2022 12:20:11 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, armbru@redhat.com,
 joe.jin@oracle.com
Subject: Re: [PATCH v3 1/1] monitor/hmp: print trace as option in help for
 log command
Message-ID: <YyMKa64248tyWrEe@work-vm>
References: <20220831213943.8155-1-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831213943.8155-1-dongli.zhang@oracle.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

* Dongli Zhang (dongli.zhang@oracle.com) wrote:
> The below is printed when printing help information in qemu-system-x86_64
> command line, and when CONFIG_TRACE_LOG is enabled:
> 
> ----------------------------
> $ qemu-system-x86_64 -d help
> ... ...
> trace:PATTERN   enable trace events
> 
> Use "-d trace:help" to get a list of trace events.
> ----------------------------
> 
> However, the options of "trace:PATTERN" are only printed by
> "qemu-system-x86_64 -d help", but missing in hmp "help log" command.
> 
> Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>

Queued

> ---
> Changed since v1:
> - change format for "none" as well.
> Changed since v2:
> - use "log trace:help" in help message.
> - add more clarification in commit message.
> - add 'Fixes' tag.
> ---
>  monitor/hmp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/monitor/hmp.c b/monitor/hmp.c
> index 15ca04735c..a3375d0341 100644
> --- a/monitor/hmp.c
> +++ b/monitor/hmp.c
> @@ -285,10 +285,15 @@ void help_cmd(Monitor *mon, const char *name)
>          if (!strcmp(name, "log")) {
>              const QEMULogItem *item;
>              monitor_printf(mon, "Log items (comma separated):\n");
> -            monitor_printf(mon, "%-10s %s\n", "none", "remove all logs");
> +            monitor_printf(mon, "%-15s %s\n", "none", "remove all logs");
>              for (item = qemu_log_items; item->mask != 0; item++) {
> -                monitor_printf(mon, "%-10s %s\n", item->name, item->help);
> +                monitor_printf(mon, "%-15s %s\n", item->name, item->help);
>              }
> +#ifdef CONFIG_TRACE_LOG
> +            monitor_printf(mon, "trace:PATTERN   enable trace events\n");
> +            monitor_printf(mon, "\nUse \"log trace:help\" to get a list of "
> +                           "trace events.\n\n");
> +#endif
>              return;
>          }
>  
> -- 
> 2.17.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


