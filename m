Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2920912F49
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 15:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMYJn-0001Il-1t
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 09:33:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYIU-0000qD-As
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:32:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hMYIT-0007Z0-BL
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:32:18 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:35532)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hMYIT-0007Wq-5g
	for qemu-devel@nongnu.org; Fri, 03 May 2019 09:32:17 -0400
Received: by mail-oi1-x229.google.com with SMTP id w197so4435089oia.2
	for <qemu-devel@nongnu.org>; Fri, 03 May 2019 06:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OA/eCiV4/Br9WIY15LkCNmcRYoJM+/C5INnekXkEn2s=;
	b=Uf2ntE0g/g17eZvrRRSns/CIuJqC9yEv7m5cE9N8lwMPacq2Fb6rfm/YHXnnO8Lp2s
	5eRorjvgLSgfO5k8aUbzXGCUYR7EBAG9JbKW6iqEDTQpJJgYz+nlDL/ytyRvNXAzIwee
	fdnrqo1jJL3N5/lTFS/ijJq9ZXdXzopFdfQACbbuhN1c9JZ9HnoNYrjlrfonGJfdNjSb
	oFrkAoflhBjdDT8sBPR3A4AG71SnvLE73YxjgbKVYxZcvTvploVqo/Evv8V7d/tBzJRk
	IN71ZT8JJPf89jEG7MceWgB9GcK+OqbQDej4qkWVF++TGFwl7oll51Jkn84sNNc+lpV+
	aNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OA/eCiV4/Br9WIY15LkCNmcRYoJM+/C5INnekXkEn2s=;
	b=fkKnOxqAKSDZW3fhmEMXapPaa215WGIyCSqZAiioxm4oFB6MQS3bmbWm3C4De1dI6o
	V+edtbMOxc9Mf1kK8Yn6qCUzxVm5BZBxMRinOKfp7CJzJOuDQ0kJlfpVvaVexLkoA6/p
	I3uAMqoGokSPPG/HR244Cb1plWu59k4i/cFgd8/Ff11ri+aI7nSsdwcrEMgElkiH+FZz
	l/a1EZ+A0z0bh1JC8NvCawkUrB7KlHzvBLxUZH2Z88pGQJK6MOhS6oGiXKLBW0HsKhHs
	+cMX1byYzJODJSM+9krelb2qBgVu0PjZlKq1SbWbb0vkw9ZrmM7gYd5jX0/rfz5lKmGA
	5SeA==
X-Gm-Message-State: APjAAAUa1G5LdxpW/dvZa36Hd7RApD6ZoK3YU95GASbDnhh7LkrKo2Cl
	QVk7QHHH1JdS3uYQj/zyA1Q8UZdche0aN8bYV4ydyw==
X-Google-Smtp-Source: APXvYqyS5u+ZVXJzAwuNX+Kmxc1hHHS+mIXVf4GEL18uzW3t+yN5BWS6dSGsdyFETqRSvSAeYTcL5xEqHv08wS6L0aM=
X-Received: by 2002:aca:110f:: with SMTP id 15mr1642459oir.163.1556890335654; 
	Fri, 03 May 2019 06:32:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190503022958.1394-1-joel@jms.id.au>
In-Reply-To: <20190503022958.1394-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 May 2019 14:32:04 +0100
Message-ID: <CAFEAcA_yYvV-WmeicEo_EYBFp=0987fFORaqcv3tucX=Db=Hbg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::229
Subject: Re: [Qemu-devel] [PATCH v2] arm: aspeed: Set SDRAM size
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 3 May 2019 at 03:30, Joel Stanley <joel@jms.id.au> wrote:
>
> We currently use Qemu's default of 128MB. As we know how much ram each
> machine ships with, make it easier on users by setting a default.
>
> It can still be overridden with -m on the command line.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---



Applied to target-arm.next, thanks.

-- PMM

