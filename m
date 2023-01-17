Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA466DE40
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 13:56:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHlVU-00019F-Uk; Tue, 17 Jan 2023 07:56:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1pHlVR-00018y-9M
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:56:01 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pyr@spootnik.org>) id 1pHlVP-0002wK-Ew
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 07:56:00 -0500
Received: by mail-yb1-xb31.google.com with SMTP id 203so33836489yby.10
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 04:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spootnik-org.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yO9Vu3cBKQTr12+wvjXMHm+04X1bo11H22tQFuYfSHo=;
 b=FTU7eMGyMBYMBEfem4GHU7SE+lMUkJL78FzyRdeQz0KFYuBfUhrajOkbi+3VbX9A75
 GZP2ygZ3Cb2tz0HLe+CgW7OtnOp4ZwAroFFzTAu/oyPx8W88VvxbT1uiraaUQcEZCkO3
 3+f5O5HLprbVr31+e+157+P4wUuzaNleXfdgvc6DxXIg8eiChmcX9JT6nrQqDowohkHK
 B/+UfdM8FcDJhcQYU8Z4BZ3uaXW2e1WuWKu0lgFcMUl3W+mu2Ou/oqGBNKKkrsx/fYd0
 iKVplSndcADa6tjCF9nng7AIj+wUINxJGgNvTXMkdhyj+21DM9hbKC6m0NqTpRuiEYAt
 V7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yO9Vu3cBKQTr12+wvjXMHm+04X1bo11H22tQFuYfSHo=;
 b=nbr4Xx6zPWZPuQMDljCA9FCmaJBV33kxhpEjs6qO0HQ6kNuakGJWcGFUyC/1ujV000
 ROGCyEO5QxWjaXJv9NvvOuDSboxjK4FvE88BynTnRIWfDhDXXUBPCPssGs1iHi+f0evx
 sGHKtfOXcsrMH0eARjqLUvN4euUK0HzZsjM5sBbFsayFP0mugOKHs/CiW6Rv96ChBPdA
 Ln2IstvzIgkanaJCz2K7bNUpuB8DqNbxPbCS2HqmEHK6OpEtfm9gvmd9inBh5mTophD0
 Ynk6GhgER/UKl/KXyVaNvs5rQRR9IinqT9Ys9LvfvslJFj4H/0kiSqa/1ZdeZFdNdaRD
 +bKw==
X-Gm-Message-State: AFqh2kpKtu8HKt2oc7F66nrpanHt1NknZ5Ziald2AHBdrEu7qI2pFoAb
 czU0E8XeQ9OHV5tL098+zLWzi+g66zlz1BPJJT+jwQ==
X-Google-Smtp-Source: AMrXdXsyBdYbKu+X4I21OtHCAHuhKEoq3tlQB03GOGJpX+6NTNwV6+loSKuQ5lqU17O1tYdVodNohLvN8hNcnpCzvbI=
X-Received: by 2002:a25:cf52:0:b0:759:65ed:fe8a with SMTP id
 f79-20020a25cf52000000b0075965edfe8amr426283ybg.310.1673960157768; Tue, 17
 Jan 2023 04:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20221202151202.24851-1-pyr@spootnik.org>
 <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
 <20230117124312.ebe4qpp6p3hjew32@sirius.home.kraxel.org>
 <Y8aaNY8oVZ4z8hTt@redhat.com>
In-Reply-To: <Y8aaNY8oVZ4z8hTt@redhat.com>
From: Pierre-Yves Ritschard <pyr@spootnik.org>
Date: Tue, 17 Jan 2023 13:56:02 +0100
Message-ID: <CAJwCgu-YHcZH-QoOZjvBk5j7AC3nL_FDf5M+x_53SDHqp=jcoQ@mail.gmail.com>
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000092901f05f27538bb"
Received-SPF: none client-ip=2607:f8b0:4864:20::b31;
 envelope-from=pyr@spootnik.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000092901f05f27538bb
Content-Type: text/plain; charset="UTF-8"

> Please don't queue, this patch is not correct becasue it is failing
> to validate the 'websocket' parameter at all.
>
>
Hi,

Thanks for the review! I'm happy to adapt the patch to add validation,
though I am not quite sure what additional validation you would like to
see occur here.

Cheers,
Pierre-Yves

--00000000000092901f05f27538bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Please don&#39;t queue, this patch is not correct becasue it is failing<br>
to validate the &#39;websocket&#39; parameter at all.<br>
<br></blockquote><div><br></div><div>Hi,</div><div><br></div><div>Thanks fo=
r the review! I&#39;m happy to adapt the patch to add validation,</div><div=
>though I am not quite sure what additional validation you would like to</d=
iv><div>see occur here.</div><div><br></div><div>Cheers,</div><div>Pierre-Y=
ves<br></div></div></div>

--00000000000092901f05f27538bb--

