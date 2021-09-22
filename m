Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C9D414D57
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 17:49:27 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT4Uw-0007qS-Hy
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 11:49:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT4TK-0007AB-Kj
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:47:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mT4TH-0007Zu-N5
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 11:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632325661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WAv08iFIqJGj1uH51PdFF3zcd8qgl6B1uKeE/DHAfvU=;
 b=Jo6d/nH8IjIKqFVBFSP0T1tYdKNlq48fU4V3B1cX/wp3ClZDYRYtTZzUz46jW+FroSPx5O
 JwIX8trJtJHm2LV0MBGziPX8a2ajSWRBCKNbVcVwROYf2gg40Oo14681mJJ6bj+Y9OlXDG
 WXrj/6WJ+wDr+ucdtVg6201YhdxJNrI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-J_me1FOCPFWzRhq5RPUsNA-1; Wed, 22 Sep 2021 11:47:40 -0400
X-MC-Unique: J_me1FOCPFWzRhq5RPUsNA-1
Received: by mail-wr1-f69.google.com with SMTP id
 u10-20020adfae4a000000b0016022cb0d2bso2538152wrd.19
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 08:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WAv08iFIqJGj1uH51PdFF3zcd8qgl6B1uKeE/DHAfvU=;
 b=duZHFrWkoYqecas3yg0VBbpz67suvnZyMNRdlqrdgAt7QBV/zUoo97BQKe8cdFrkYX
 yO4AkccL3FwwGFDhxqa1hjWgV03Y3uWBoWoLIZBGRLHtJQDrcQeoP6n1MXX+t7P2CFGL
 aRxJWBMfldzFLCHZSTXcTY/4LYiVlKsa5FRbVg72vs85Ov4mrz+d0Mjmo4MKxExTMZ5f
 8lH4iDBCQI2vWcHcotxIp69hw2C0shbM9zQHfy7T+zYJ8Osos40woI0r2Y3HIcTDgeIE
 Si/0dICoT8TbdxWPaa18OLFRhjJm3HX0tJiBLYyd8HmJjZUSBM/g/kWQNHmCyBw/Lh1V
 dKaw==
X-Gm-Message-State: AOAM5306/w7PbL7Zk5SwBJGbh3aQsXK2I9s+Gun88rSv4P+HxijoGcFS
 tG/k+sQqbTWRXJnj0dt0lo++TUvO14InlGzrjUrrZjaiZ1nQ3Gs4CHXLu85kc/0nH1hFMwPRtvF
 tvJF/VVPoxJecce8=
X-Received: by 2002:a5d:4388:: with SMTP id i8mr309622wrq.340.1632325659411;
 Wed, 22 Sep 2021 08:47:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUuyFs7yFhcPN5JHH+BORGBc+ziooKkvLSJRncHP0V+0WhP3MHd442ry4e4+J899rhmYTZgg==
X-Received: by 2002:a5d:4388:: with SMTP id i8mr309599wrq.340.1632325659166;
 Wed, 22 Sep 2021 08:47:39 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id i187sm2581316wma.0.2021.09.22.08.47.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 08:47:38 -0700 (PDT)
Message-ID: <dae9daae-aa8d-ddb7-ecf3-95e91defea53@redhat.com>
Date: Wed, 22 Sep 2021 17:47:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/3] scsi: make io_timeout configurable
To: Hannes Reinecke <hare@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201116183114.55703-1-hare@suse.de>
 <20201116183114.55703-3-hare@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20201116183114.55703-3-hare@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Hannes,

On 11/16/20 19:31, Hannes Reinecke wrote:
> The current code sets an infinite timeout on SG_IO requests,
> causing the guest to stall if the host experiences a frame
> loss.
> This patch adds an 'io_timeout' parameter for SCSIDevice to
> make the SG_IO timeout configurable, and also shortens the
> default timeout to 30 seconds to avoid infinite stalls.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> ---
>   hw/scsi/scsi-disk.c    |  6 ++++--
>   hw/scsi/scsi-generic.c | 17 +++++++++++------
>   include/hw/scsi/scsi.h |  4 +++-
>   3 files changed, 18 insertions(+), 9 deletions(-)

>   int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
> -                        uint8_t *buf, uint8_t buf_size)
> +                        uint8_t *buf, uint8_t buf_size, uint32_t timeout)
>   {
>       sg_io_hdr_t io_header;
>       uint8_t sensebuf[8];
> @@ -520,7 +522,7 @@ int scsi_SG_IO_FROM_DEV(BlockBackend *blk, uint8_t *cmd, uint8_t cmd_size,
>       io_header.cmd_len = cmd_size;
>       io_header.mx_sb_len = sizeof(sensebuf);
>       io_header.sbp = sensebuf;
> -    io_header.timeout = 6000; /* XXX */
> +    io_header.timeout = timeout * 1000;

> @@ -637,7 +639,7 @@ static int get_stream_blocksize(BlockBackend *blk)
>       cmd[0] = MODE_SENSE;
>       cmd[4] = sizeof(buf);
>   
> -    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf));
> +    ret = scsi_SG_IO_FROM_DEV(blk, cmd, sizeof(cmd), buf, sizeof(buf), 6);

Why is this timeout hardcoded? Due to the /* XXX */ comment?


