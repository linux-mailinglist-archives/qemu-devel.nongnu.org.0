Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8B1419D7D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:51:00 +0200 (CEST)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUumJ-0005qq-CT
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mUuiu-0003ip-GM
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:47:29 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mUuis-0006Ki-Rj
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:47:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so1316024wmc.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=csS98ekpAJUh5o5O+bLeK+YStOBmd5/EZyjT7Wp5o/M=;
 b=NALxMt5Ik1S27HEdQ/FUadV2mDralzct9CHOXbF74wATYoepktuAxJ19L9CfgVgiKO
 KvZB64OeID/gI0D9c75FNgHq4MEf9rsCO+5rY4IwW25wDm5Pk06sZEYrxcwn+9o9opNe
 QU7vfiMyrFEhRjPMXn7WU6bL1Nu2wzlNDgCffWd0k46fOhjlnjbzmF3TO7Ztcx2NbpkP
 6VHnMfi1tsCl5a53CdJN6Jzc3UzaHbxBdKNg+9IDgqRQPviv7CpdjAS1RU1+hjGdArRl
 9zKJh1ZBCMaVYBjtd+pnPrR/ZBzogCjdMMCDBDbalR3RP6QVKX4heVka4t6adKiwMQ3X
 TNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=csS98ekpAJUh5o5O+bLeK+YStOBmd5/EZyjT7Wp5o/M=;
 b=QEQZicFjYaZK3hTGHThnPjTvDRLcZb1AQV9DFMoEof3rN30hzL2e0ER3XwFgBPBo7f
 k3MQNl2e8dD3JAwLvyUj1cJuiuoqaYYRTuXvVQRbDR2ZEQcS7HGbcnDnepKPtKD2moIO
 PRyIzSCm5+brki04PkkEcCF0oLk3v1NVJMZGw+5jksCDk2WXKIPW3ZQBKItNPXQ+aHqf
 UlDZ07Obw77VBM3DbTQWQkhz4WXhOWYPQRW3o2K3FU9Nv1DiGb84szehRBrVCIafEfOy
 y3kQQX6cyYINkyVhpCflCxVE/SbBzpwJfdQWF3qlQw0TRVg3nPHbjwWktzRtWMjUElrm
 XuFA==
X-Gm-Message-State: AOAM532tNVjYhGzU8PNhZMqUsvXwrsnrCHVV05KRMd/cs/jc5MMWumpL
 WxO9T3cIuqqnXz+VdTVxF/On9kWcETr77z7fGiFe/g==
X-Google-Smtp-Source: ABdhPJzNcQX1BYiwtbluahkynXPju4ofsjTOAJddJEMbOPdN4Vm0g4Yic3QOUNRTrpxPPL9XUK9ybES95S4/fhWtIyc=
X-Received: by 2002:a05:600c:3b1b:: with SMTP id
 m27mr328971wms.15.1632764844453; 
 Mon, 27 Sep 2021 10:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210921093227.18592-1-kevin.townsend@linaro.org>
 <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
In-Reply-To: <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
From: Kevin Townsend <kevin.townsend@linaro.org>
Date: Mon, 27 Sep 2021 19:47:13 +0200
Message-ID: <CAFPHj6OXYgerTxDhXyxxWnb4CS33N-+2RVntKauD+rBPqUMvqg@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008e41a305ccfdb0c0"
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008e41a305ccfdb0c0
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for the updated review.

On Mon, 27 Sept 2021 at 18:39, Peter Maydell <peter.maydell@linaro.org>
wrote:

> I thought we'd agreed to implement the whole of the auto-increment
> logic, not just for specific registers ?
>

The problem I have here is ... how many bytes are we willing to buffer?
There's no
reason I can't request 512 registers, for example. Should we limit the
buffer length
to a single 'full' set of register values?

Kevin

--0000000000008e41a305ccfdb0c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>T=
hanks for the updated review.<br></div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 27 Sept 2021 at 18:39, Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">I thought we&#39;d agreed to implement the whole of the auto-incremen=
t<br>
logic, not just for specific registers ?<br></blockquote><div><br></div><di=
v>The problem I have here is ... how many bytes are we willing to buffer? T=
here&#39;s no</div><div>reason I can&#39;t request 512 registers, for examp=
le. Should we limit the buffer length</div><div>to a single &#39;full&#39; =
set of register values?<br></div></div><div class=3D"gmail_quote"><br></div=
><div class=3D"gmail_quote">Kevin<br></div></div>

--0000000000008e41a305ccfdb0c0--

