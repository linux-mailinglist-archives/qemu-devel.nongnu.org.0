Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6894E2326
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 10:17:40 +0100 (CET)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWEAV-000703-F8
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 05:17:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nWE81-0004oE-33
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:15:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1nWE7y-00046q-Rr
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 05:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647854102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2ZzT70PZ1sEn2MaePquHviM94lbPVk+KL7ml+Za3xU=;
 b=CHkM0mhgi3Wb3tH8GPDDGGNboT4T5LlOsueM2SwsgDXmQ22q+uP/7u09WgwkxiJEoMxaNZ
 U3u0nUWxR73ivW8NMVXBO+fZIonvP7jIb3MkssAAEcnKXAjMVGE41QLXb7zOuod85lmBhL
 +yW4JN0Ug3fwsiSvMVxMeAZDcICYmZo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-uVoANqPIMV63HKmfT9o5Vg-1; Mon, 21 Mar 2022 05:15:00 -0400
X-MC-Unique: uVoANqPIMV63HKmfT9o5Vg-1
Received: by mail-ed1-f71.google.com with SMTP id
 n4-20020a5099c4000000b00418ed58d92fso7581480edb.0
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 02:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l2ZzT70PZ1sEn2MaePquHviM94lbPVk+KL7ml+Za3xU=;
 b=6d3vv04f01k2yh1v0DsjCHzHdSu23ZFSCSOTrMxDEKBW0UsrREHyZrF1lQo7Sy8WV9
 wnsiZMQxGCvzkgT9OJs830W0uuxYEwAwc6fEsp10LyVzaZN2ChNXMrM8or0boNhAfpMn
 8ZJ/fOsx1Xvy/ItjxJbfsgtBVa8hrm6qOSpKz/PIPv0a3PW9ZWdyoJ99yqTrp3EDYsdQ
 Lw+CysMDkg0uUIPM5rn0xmDAzswf3nSuiG+3ks1B6UGoGgzAJdEAHoWhJZ04Vycj8TBq
 OaXB8mNS2C4HyKG85Ji0HLlnZVslGjlhzaQCnBb6WGVE+RN9rikfrvsshCmM/+4830Gi
 Rz9w==
X-Gm-Message-State: AOAM532cifl43l+yU/k055LUSN5OfipWTXFj2fDHwArxIFHwu12Kb1kB
 BXovN8tndMyzTN2ud+tEZklYgxyyyvqDoLi3RFD1Wm6CJvkoLfBO6JC6+9DHWliNxFO/Ikj5rnN
 OPlWYUw64/uOIEfY=
X-Received: by 2002:a17:906:dc8b:b0:6df:7a71:1321 with SMTP id
 cs11-20020a170906dc8b00b006df7a711321mr19433441ejc.476.1647854099497; 
 Mon, 21 Mar 2022 02:14:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBPbFj5f0qa6/pXHUPYU3Dx7brggK659WpG8ZwgTseJpPAh4MFY/xJ+sVHgfYig0nAGIOS3A==
X-Received: by 2002:a17:906:dc8b:b0:6df:7a71:1321 with SMTP id
 cs11-20020a170906dc8b00b006df7a711321mr19433431ejc.476.1647854099323; 
 Mon, 21 Mar 2022 02:14:59 -0700 (PDT)
Received: from [10.43.2.152] (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 hu8-20020a170907a08800b006dfd2056ab2sm2831815ejc.97.2022.03.21.02.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 02:14:58 -0700 (PDT)
Message-ID: <10f8e706-ae5b-6cd1-d057-110933b865ff@redhat.com>
Date: Mon, 21 Mar 2022 10:14:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 3/3] qga/commands-posix: Fix listing ifaces for Solaris
To: Andrew Deason <adeason@sinenomine.net>, qemu-devel@nongnu.org
References: <20220320213843.4544-1-adeason@sinenomine.net>
 <20220320213843.4544-4-adeason@sinenomine.net>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
In-Reply-To: <20220320213843.4544-4-adeason@sinenomine.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mprivozn@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/22 22:38, Andrew Deason wrote:
> The code for guest-network-get-interfaces needs a couple of small
> adjustments for Solaris:
> 
> - The results from SIOCGIFHWADDR are documented as being in ifr_addr,
>   not ifr_hwaddr (ifr_hwaddr doesn't exist on Solaris).
> 
> - The implementation of guest_get_network_stats is Linux-specific, so
>   hide it under #ifdef CONFIG_LINUX. On non-Linux, we just won't
>   provide network interface stats.
> 
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
> ---
>  qga/commands-posix.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index bd0d67f674..c0b00fc488 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2781,20 +2781,21 @@ guest_find_interface(GuestNetworkInterfaceList *head,
>              return head->value;
>          }
>      }
>  
>      return NULL;
>  }
>  
>  static int guest_get_network_stats(const char *name,
>                         GuestNetworkInterfaceStat *stats)
>  {
> +#ifdef CONFIG_LINUX
>      int name_len;
>      char const *devinfo = "/proc/net/dev";
>      FILE *fp;
>      char *line = NULL, *colon;
>      size_t n = 0;
>      fp = fopen(devinfo, "r");
>      if (!fp) {
>          return -1;
>      }
>      name_len = strlen(name);
> @@ -2836,20 +2837,21 @@ static int guest_get_network_stats(const char *name,
>              stats->tx_errs = tx_errs;
>              stats->tx_dropped = tx_dropped;
>              fclose(fp);
>              g_free(line);
>              return 0;
>          }
>      }
>      fclose(fp);
>      g_free(line);
>      g_debug("/proc/net/dev: Interface '%s' not found", name);
> +#endif /* CONFIG_LINUX */

I wonder whether we should signal this somehow. I mean, have something
like this:

#else /* !CONFIG_LINUX */
  g_debug("Stats reporting available only for Linux");
#endif /* !CONFIG_LINUX */

>      return -1;
>  }

A counter argument is that if fopen() above fails then -1 is returned
without any error/debug message reported. And stats fetching is best
effort anyway.

Michal


