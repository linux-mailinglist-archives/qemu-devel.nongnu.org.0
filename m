Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E26CD6B5
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 11:43:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phSKe-0004Ob-2b; Wed, 29 Mar 2023 05:43:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phSKb-0004OD-Ne
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:43:01 -0400
Received: from esa9.hc2706-39.iphmx.com ([216.71.140.197])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1phSKa-0004gi-7t
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 05:43:01 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 269463535
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:9HNGN6jXZWCKjix1xhw8WzNQX1613RIKZh0ujC45NGQN5FlHY01je
 htvXWvQOK7ZNjOmf911b4+2oEMB6MPcyII1TAFl/ilhRngW8JqUDtmndXv9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZvPakjUGL2zBH5MrpOfcldEFOlGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiM+t5qK23CulQRrukoPD8fwXG8M49m/c3Gd/
 /0W3XC4YV9B0qQhA43xWTEBe811FfQuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbcTp+QuAE4Jy
 ec3cB0LZU+ph+at3ovuH4GAhux7RCXqFIYWu3Ul1C+ASPh5GNbMRKLF4dIe1zA17ixMNayGN
 oxJNHw1NUWGPEQn1lQ/UfrSmM+hgmn5fydwok/TqKYqi4TW5FYvgeSza4eOJ7RmQ+1sn0SW/
 V3q2F/XCxgaOduH+RC79lij07qncSTTHdh6+KeD3udnhUDWymENBRk+U1y9rv+kzEmkVLpix
 1c8/yMvqe0r6hXuQIakGRK/p3GAs1gXXN84//AG1TxhA5H8u26xblXohBYYADD6nKfanQAX6
 2I=
IronPort-HdrOrdr: A9a23:lUsUuqnJqq5Vgw9mzr52gi12RQLpDfIS3DAbv31ZSRFFG/Fw9v
 rPoB1/73TJYVkqNU3I5urwX5VoLUmxyXcN2/hzAV7AZmjbUQmTXeVfBNDZsl/d8kTFn4ZgPM
 xbHZSWZueeMbErt6zHyTj9Lsgh3cSK6+SDpcq29QYJcT1X
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Mar 2023 05:42:58 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 v8-20020a0ccd88000000b005c1927d1609so6292210qvm.12
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 02:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1680082977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PR9nMFXxzcUUsHKC1r4GTzNZ28WiAhK2Q+cJCM1YNjQ=;
 b=la2usnG5YAi1Hu7zRuyEiAPjO8ZlxSd9Sgp8j1iLTdp0eNjek0yxE1XtG7xZVTw9Gt
 dwaMMiZdrIc5+8SWglWMux95oaToK/DzWG6huVs+yXUamk2+iX03C7pqY50vk01UvPyZ
 CHrORFepdeLG7quzICCkolgQu98GImgefFGZfzxgabPPupoV9dP6FC2ttJHuveak1WzO
 36lJ9TDu3uBfO77IGUPDOV/MQ0/OiSryErdyr/fjg/7adMe4rxYr/0h//+kaQUSslHoZ
 Pj3sBoia79zO6pNL/shX20n6T1GZNxleU18NvfNlOhi2iUccjn2N8covGHs9gPwzAbCf
 usfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680082977;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PR9nMFXxzcUUsHKC1r4GTzNZ28WiAhK2Q+cJCM1YNjQ=;
 b=Ygv0T2sJ5t+T+yseoaeg5zV0OMqP0gzJbqqahsl7gyTauWfUAIJPw3ueVPy7TKIpJZ
 +Nsgw7cWjA8G3gSlYHgU4u1uGLwndb4i+Aru++zfHdgl+qx7Rne8KJ8VfsBoPvXMQLzb
 lsvsMhM0rYSAaXvJUt3m2Mp5QdMNzzJU82lWPjn6CgBlrXOpjCPkdy1BNl9LBpGjeHa9
 O0hG0+oP+1KnWuiKv+gMRobLCXS1i35xkTLOjm7QaXPg7u991drLSEgk79L+Jcgqh+J0
 c7zMiaSGGZPT6Jsw4MH19BIdhgzBWAOOpNfbIpawQNCbJhd6lRobxpSjg08CL795cVzM
 1oSw==
X-Gm-Message-State: AAQBX9d0mmXeRIzAZiYbEbmozU5Q8wUHT7m/cqfraMzRIuw1lva3blwC
 xk1Baa5fg2Yzw9zBU+d1O6+Q4uv1wr16xcJYyjiQyf2/isU1RW6rRII86EgkrZ1/g6uDNZHL1V6
 idZ942F0AAoeuYxkLtehzq0SFSX2+Mg==
X-Received: by 2002:ac8:5c46:0:b0:3e4:e8a8:f235 with SMTP id
 j6-20020ac85c46000000b003e4e8a8f235mr17180885qtj.36.1680082977376; 
 Wed, 29 Mar 2023 02:42:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLU3Oetb8PN833fQw9PmyJSm7OosvfcDq78RWeiXRJvjCmD2Rkip2IZ2oSooMMWetCgR4o/A==
X-Received: by 2002:ac8:5c46:0:b0:3e4:e8a8:f235 with SMTP id
 j6-20020ac85c46000000b003e4e8a8f235mr17180876qtj.36.1680082977174; 
 Wed, 29 Mar 2023 02:42:57 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 p204-20020a3742d5000000b00749fc742ab4sm114706qka.7.2023.03.29.02.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 02:42:56 -0700 (PDT)
Date: Wed, 29 Mar 2023 05:42:53 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [PATCH] usb/dev-wacom: fix OOB write in usb_mouse_poll()
Message-ID: <20230329094253.jxn2ikrn646a2hi6@mozz.bu.edu>
References: <20230213174113.591632-1-mcascell@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230213174113.591632-1-mcascell@redhat.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.140.197; envelope-from=alxndr@bu.edu;
 helo=esa9.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230213 1841, Mauro Matteo Cascella wrote:
> The guest can control the size of buf; an OOB write occurs when buf is 1 or 2
> bytes long. Only fill in the buffer as long as there is enough space, throw
> away any data which doesn't fit.
> 
> Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>

Tested-by: Alexander Bulekov <alxndr@bu.edu>

Thanks

> ---
>  hw/usb/dev-wacom.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> index 7177c17f03..ca9e6aa82f 100644
> --- a/hw/usb/dev-wacom.c
> +++ b/hw/usb/dev-wacom.c
> @@ -252,14 +252,20 @@ static int usb_mouse_poll(USBWacomState *s, uint8_t *buf, int len)
>      if (s->buttons_state & MOUSE_EVENT_MBUTTON)
>          b |= 0x04;
>  
> -    buf[0] = b;
> -    buf[1] = dx;
> -    buf[2] = dy;
> -    l = 3;
> -    if (len >= 4) {
> -        buf[3] = dz;
> -        l = 4;
> +    l = 0;
> +    if (len > l) {
> +        buf[l++] = b;
>      }
> +    if (len > l) {
> +        buf[l++] = dx;
> +    }
> +    if (len > l) {
> +        buf[l++] = dy;
> +    }
> +    if (len > l) {
> +        buf[l++] = dz;
> +    }
> +
>      return l;
>  }
>  
> -- 
> 2.39.1
> 
> 

