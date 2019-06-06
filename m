Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D201381C2
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 01:22:09 +0200 (CEST)
Received: from localhost ([::1]:44942 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZ1hw-0003yt-EW
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 19:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43972)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hZ1gY-0003WG-Th
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hZ1gY-0004tB-2D
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:20:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:42391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hZ1gX-0004rl-Sx
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 19:20:42 -0400
Received: by mail-wr1-f66.google.com with SMTP id x17so273351wrl.9
 for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 16:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AL7MkOIQG4wiEAA9Uep7oRen7Cjck9DMh1npa2nSyjw=;
 b=fBw0OlokQ39w+lr/hCuShzEv2gDjwhaHMijq7MPjFqwjXs3kwQCkrUN7pRNq2ygSgU
 T7CW2kL0m0aZAVbhZhI2T+Ug4OrnZsR548mb8C1nq4xSIwlr7+mMjNyUhiBmDInC1hxI
 zVGWiwZ7U75lMeBBw14M8jOA7wiXm5uuXB8710B2Q3cZuIvJlUFKtyt5o09mbWC8ZYE2
 yuGlATzAsgFNjfMxX9dUxTOrrYmeT9S2eU6eh1RgE3sB4iCCcRlhoDI9ESIb9ndIBH8e
 DLb8FJ6zoMadknIhQyVyLR1S7egA8EaMeqgXz+fTTLiYYpeGZY7ya959lxXXtVaXex5z
 2WbQ==
X-Gm-Message-State: APjAAAUtXZVsGeYfmFsTYOZoUi4BSgL8QKj2B6lqbPXUeLIcBScnN9Jo
 IqhG80giFr12MPfa0HnNozw5TG8U+wPpSg==
X-Google-Smtp-Source: APXvYqwj+/Ebr/kCt5xJ9xrO801FL6nfSJoigZy9ei1gMEd/PTGBhduYFJRr3JGchYtKK0AQEmkR+w==
X-Received: by 2002:a5d:4bd0:: with SMTP id l16mr916578wrt.141.1559863240411; 
 Thu, 06 Jun 2019 16:20:40 -0700 (PDT)
Received: from [192.168.0.156] ([78.192.181.46])
 by smtp.gmail.com with ESMTPSA id j66sm504285wmb.24.2019.06.06.16.20.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Jun 2019 16:20:39 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20190606082900.6330-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <674c0706-708a-6378-bf79-cca610249d31@redhat.com>
Date: Fri, 7 Jun 2019 01:20:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190606082900.6330-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: put myself forward for gdbstub
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

Hi Alex,

On 6/6/19 10:29 AM, Alex Bennée wrote:
> As I've been reviewing a lot of this recently and I'm going to put
> together a pull request I'd better keep an eye on it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a96829ea83..8ef34cf1ce 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1872,7 +1872,8 @@ F: util/error.c
>  F: util/qemu-error.c
>  
>  GDB stub
> -S: Orphan
> +M: Alex Bennée <alex.bennee@linaro.org>

Feel free to add:

R: Philippe Mathieu-Daudé <philmd@redhat.com>

> +S: Maintained
>  F: gdbstub*
>  F: gdb-xml/

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,

Phil.

