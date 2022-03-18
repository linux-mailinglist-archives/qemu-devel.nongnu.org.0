Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F5E4DDBD9
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:43:19 +0100 (CET)
Received: from localhost ([::1]:45446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDp0-00038L-GQ
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:43:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDnx-00024j-0F; Fri, 18 Mar 2022 10:42:13 -0400
Received: from [2607:f8b0:4864:20::72a] (port=36804
 helo=mail-qk1-x72a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nVDnv-0007JN-JV; Fri, 18 Mar 2022 10:42:12 -0400
Received: by mail-qk1-x72a.google.com with SMTP id v13so6895843qkv.3;
 Fri, 18 Mar 2022 07:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SfpSlaeSXZo1y30f3pb9kjCTVX4TumNf/45wRfbgvxU=;
 b=YMv4Ty7VtRMg5sWv1QBEWB/CuOfMFSuvdLO2ZkECGm72BG9r8JjHmevIUQC+ngfV5w
 pHKYAmPFgsJQ8CY64As0QtvtRv8wvNxEUrchcxgEvs53aNBIHuW/3ENijllGqcySqC4J
 61xpLRQ1gz4GX3F8XlMovq0niRhfuRH5HT0qQrQ4eaJN1dgt2UW/diMpduq5COubjFW5
 vPbwRrAI1DYWeIfzV4b6n/DjvYUYpgl143L2WsjCjd7KkSWm9LWJRuJaIyuM8iRJlOgv
 vYre8eXGB5wzkfIWNtZqu7gE8AOdzjbqdMv8QcZ+jxG1PxStWyEEzo9HkK6Rx6VNhgw2
 G7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SfpSlaeSXZo1y30f3pb9kjCTVX4TumNf/45wRfbgvxU=;
 b=VHT9dFXODLIv9elYnIlYigJnoRRYcImggsLhH5fVHaGuO/V2KxfsTLbflgiSUQpYHh
 ZqsuolUWrnxqd9DUoLLAgWJbr7xxNc6DB4xNJxkx4tyijGUmEHGYMvGrzOg2NGO9Dibc
 3my2OCllJVqnaLFldIEGbwGuwX+HZSn25Mu9D/ghPiZHdyvja5VST7gSNQoFdh72crBP
 5Bn2TKrgQjwofXVacowpX97ISVwdNxMFrmzQ7fyRTIr60293MxRkF8+DXpnO4GkjuRZj
 2bguwkCEEeooSNA0to9rdH87AkWXPG9DIXF9wrdXaNyEv1xUAIuJeM9sgYf+PeDynF5K
 olOg==
X-Gm-Message-State: AOAM530XlZgCtqrod+nssCEWFjrIFCX2RpbvdvUXzpX4tDdgPEnnYXxV
 Dv8ihAWOMlbtI7YPrdj+frQ=
X-Google-Smtp-Source: ABdhPJwlCPrcdLtbUb2vIV64GgJX1Fordf9qYkctu+7iD5/2WQr/YN0dLD0ArYf64dU7DUHhnDtEeA==
X-Received: by 2002:a05:620a:16cb:b0:67b:3189:13be with SMTP id
 a11-20020a05620a16cb00b0067b318913bemr5873892qkn.456.1647614530308; 
 Fri, 18 Mar 2022 07:42:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w17-20020ac857d1000000b002e19feda592sm5649990qta.85.2022.03.18.07.42.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 07:42:10 -0700 (PDT)
Message-ID: <423a1fb1-7395-34fe-8de4-c09b2e2f6981@gmail.com>
Date: Fri, 18 Mar 2022 15:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] vhost_net: Print feature masks in hex
Content-Language: en-US
To: Ilya Maximets <i.maximets@ovn.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-trivial@nongnu.org
References: <20220318140440.596019-1-i.maximets@ovn.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220318140440.596019-1-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/3/22 15:04, Ilya Maximets wrote:
> "0x200000000" is much more readable than "8589934592".
> The change saves one step (conversion) while debugging.
> 
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---
>   hw/net/vhost_net.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2ca4..df0f050548 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -201,7 +201,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
>               net->dev.features &= ~(1ULL << VIRTIO_NET_F_MRG_RXBUF);
>           }
>           if (~net->dev.features & net->dev.backend_features) {
> -            fprintf(stderr, "vhost lacks feature mask %" PRIu64
> +            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
>                      " for backend\n",
>                      (uint64_t)(~net->dev.features & net->dev.backend_features));
>               goto fail;
> @@ -213,7 +213,7 @@ struct vhost_net *vhost_net_init(VhostNetOptions *options)
>       if (net->nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
>           features = vhost_user_get_acked_features(net->nc);
>           if (~net->dev.features & features) {
> -            fprintf(stderr, "vhost lacks feature mask %" PRIu64
> +            fprintf(stderr, "vhost lacks feature mask 0x%" PRIx64
>                       " for backend\n",
>                       (uint64_t)(~net->dev.features & features));
>               goto fail;

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

