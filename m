Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A0F3A13F3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 14:14:11 +0200 (CEST)
Received: from localhost ([::1]:49332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqx62-0000vT-MV
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 08:14:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx5A-0000Cb-Eo
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:13:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqx58-0005tw-St
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 08:13:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623240794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q3+OCxs+z975KgIRp5rakoeswQwFeH63hEn+CxieHNw=;
 b=BLWdzv46qp/J5nlL8zUsvHot+msVzC9bqZWGB2lPlR/FDAMzVAGMPKTliGhiujPlBg9HUO
 yQLPB5YM8c8zUxO2I86EXQHNHuT4xLv1BtxRi+csUybRGoxF4DL9NCwsftYb26aexxrGiS
 OWArnXjMT8poQpB7xRU1VUws2IcuNTY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-fm9ZcMcpNdG2iKt_2rnbdw-1; Wed, 09 Jun 2021 08:13:13 -0400
X-MC-Unique: fm9ZcMcpNdG2iKt_2rnbdw-1
Received: by mail-wr1-f70.google.com with SMTP id
 e11-20020a056000178bb0290119c11bd29eso5830630wrg.2
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 05:13:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q3+OCxs+z975KgIRp5rakoeswQwFeH63hEn+CxieHNw=;
 b=s1sdJixg1EB5vgfNokN5hxDjHjkoyMCmRFYZCeB9NU5fP8qcysSmsUD/dX40ryvpEv
 2hZ6iRUJqq3hQ8wBddhfrLN757vo4vxUvcWDjT3bjYIq/Q10pyNKrlxAKAIJ7v1TNRap
 rFcce/xJH0iBYSK6m4FwqYunYg7ZdK8Zn69ErqNpi4XGhgxhssV7HSHpQHT5vCoPE0x2
 oazxu3y5fHznNo7cZwtvs0L8gphvWdOy9HYExOzto3N/Td1CjiWrQSoli1ZV1SBCUxi3
 oIZWgbhE6oCuWjliqUZahcSYwpAaCEvFHQzo4yuQhsG2utBrQ3voxJAYVjiyKIWcICfZ
 2spA==
X-Gm-Message-State: AOAM530AA0nli7GvOl+XaB4V0EUaNqSGP2dD1MqUM+W7b8yfIRRgPf1j
 sV4hGPx/TeUEQ1BfkSCG+7WHghjtNouekdn5wVn9bj1d34QkqR35QnIBhTROLYxTWDcFWwKcuhW
 xW3elGkOHP2wWNjk=
X-Received: by 2002:adf:8b91:: with SMTP id o17mr27609827wra.385.1623240791711; 
 Wed, 09 Jun 2021 05:13:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUMaV8tYdMUMihwRSVZXrn7a8MbJKtbyM+n+isSjRU+81S1sma6JYJEHtj9biIhEDzRjDH6g==
X-Received: by 2002:adf:8b91:: with SMTP id o17mr27609806wra.385.1623240791488; 
 Wed, 09 Jun 2021 05:13:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r7sm7963874wma.9.2021.06.09.05.13.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 05:13:10 -0700 (PDT)
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 fam@euphon.net, laurent@vivier.eu, hpoussin@reactos.org
References: <20210519100803.10293-1-mark.cave-ayland@ilande.co.uk>
 <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/5] esp: revert 75ef849696 "esp: correctly fill bus id
 with requested lun"
Message-ID: <09e11569-b61e-db90-efe8-7f2f3c3d4cad@redhat.com>
Date: Wed, 9 Jun 2021 14:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519100803.10293-5-mark.cave-ayland@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 12:08, Mark Cave-Ayland wrote:
> This commit from nearly 10 years ago no longer appears to be required and in its
> current form prevents the MacOS CDROM driver from detecting the CDROM drive. The
> error is caused by the MacOS CDROM driver sending this CDB without DMA:
> 
>      0x12 0x00 0x00 0x00 0x05 0x00 (INQUIRY)
> 
> This is a valid INQUIRY command, however with this logic present the 3rd byte
> (0x0) is copied over the 1st byte (0x12) which silently converts the INQUIRY
> command to a TEST UNIT READY command before passing it to the QEMU SCSI layer.
> Since the TEST UNIT READY command has a zero length response the MacOS CDROM
> driver never receives a response and assumes the CDROM is not present.
> 
> Resolve the issue by reverting the original commit which I'm fairly sure is now
> obsolete so that the original MacOS CDB is passed unaltered to the QEMU SCSI
> layer.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
> index afb4a7f9f1..a6f7c6c1bf 100644
> --- a/hw/scsi/esp.c
> +++ b/hw/scsi/esp.c
> @@ -260,9 +260,6 @@ static uint32_t get_cmd(ESPState *s, uint32_t maxlen)
>               return 0;
>           }
>           n = esp_fifo_pop_buf(&s->fifo, buf, dmalen);
> -        if (n >= 3) {
> -            buf[0] = buf[2] >> 5;
> -        }
>           n = MIN(fifo8_num_free(&s->cmdfifo), n);
>           fifo8_push_all(&s->cmdfifo, buf, n);
>       }
> 

This is probably related to S vs SATN, and the bug is that it's doing it 
even in the S case where cmdfifo_cdb_offset is zero.  You can see that 
the flow is

bus[0] = bus[2] >> 5;
    -> busid = esp_fifo_pop(&s->cmdfifo);    [do_cmd]
         -> lun = busid & 7;                 [do_busid_cmd]

However it does seem bogus.

Perhaps the "S without ATN" cases (handle_s_without_atn, 
s_without_satn_pdma_cb) should do something like

    busid = (busid & ~7) | (buf[2] >> 5);

before calling do_busid_cmd?

Paolo


