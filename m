Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4EF60768C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 13:55:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqcZ-0001AT-SR
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:55:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olqYU-00058M-F6
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 07:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqYM-0004cd-Dl
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:51:06 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olqYH-0004l6-Fi
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 07:51:06 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 r8-20020a1c4408000000b003c47d5fd475so4815822wma.3
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 04:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mSZUsrqSSadkGkHHFnqrEyoSiIuzQvl8N+m4auRe10=;
 b=de/4B7OR1i5Ot62hL7rwTo79MIkjbcNmnGSGOgBykNJx+l9T4V0MrNWEB5xR3rUVDY
 U1DEvVmorZXJ0RY0WSAhUGQEsEf7slHBEryHPiSrUVijQgiE3y4LBs/IxK7xkxTa2T1C
 lOH5UskzfU7NNJWew/A3ToOpwZafMuJmgfw7SCvZ9n8EavjQx45f9a+7opy2WKQTvKuI
 V+OvDaddAu78FRt0b4tD3osbYhXtUWlKC+VW/DpNycvbDSD+CNWlAs7Tk4sHPCOAvFyV
 rxS3MM6sAKwbZTx5CA3zgdFInkUVX7f8At1FP43x+41lxmDlOJxcgbevb3p2o0bTc/S7
 aotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3mSZUsrqSSadkGkHHFnqrEyoSiIuzQvl8N+m4auRe10=;
 b=NwHnMg3oay7nQFpSSfmQ6xLrS7wwdbczEND3XN3g1RlbGFnGqpZLjH+UrOc242fgwE
 uw4eb/j5EELUN3satr9pvvpG/g3hvFIGCcob2V35QDUuXTm1+qUCdVj4OuZJtdOXDsA/
 50rVvaM0R9HgUkEw3v5hXK/sgj5kJLcHtxexPSg/IlZ4fZLMdgl5QpWbNsNlWOaHHUKt
 zpd783yMC/aguooTy9w3MRlvnkS6eseYpSl3gwQuOeDttE2HsenlJry6orOMxBPVC73d
 9UIwRbPyQ2XZBDl2xdhFahWXDG6WN2R+SCiXJH8i0M5qen5rgxPs+OM7BeUcFSUbcxUd
 WpiQ==
X-Gm-Message-State: ACrzQf1JW0N12NDSeCSTmpyBBshDjzn9pO6t7ir6Z2l9yaRQuloql9oF
 omx+NOVD9tu/HmtO5yx4VNISHg==
X-Google-Smtp-Source: AMsMyM4oR5TFW4/6DiOciJaRtY8e7fiqQ+pp18OB9d8iuF5paztNN48vLjQbmjeA3EDZJPvB0KlRvQ==
X-Received: by 2002:a1c:5446:0:b0:3c4:1854:abc0 with SMTP id
 p6-20020a1c5446000000b003c41854abc0mr13041585wmi.7.1666353058697; 
 Fri, 21 Oct 2022 04:50:58 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a1c750a000000b003b4868eb6bbsm2833399wmc.23.2022.10.21.04.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 04:50:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B0F351FFB7;
 Fri, 21 Oct 2022 12:50:57 +0100 (BST)
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-7-lvivier@redhat.com>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>, David Gibson
 <david@gibson.dropbear.id.au>, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Eric Blake
 <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Samuel Thibault
 <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>, =?utf-8?Q?Dan?=
 =?utf-8?Q?iel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Stefano Brivio
 <sbrivio@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v14 06/17] qapi: net: add stream and dgram netdevs
Date: Fri, 21 Oct 2022 12:43:33 +0100
In-reply-to: <20221021090922.170074-7-lvivier@redhat.com>
Message-ID: <87fsfh75um.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


Laurent Vivier <lvivier@redhat.com> writes:

> Copied from socket netdev file and modified to use SocketAddress
> to be able to introduce new features like unix socket.
>
<snip>
> index eb38e5dc40bc..396c1d11e1e2 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -2772,6 +2772,18 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
>      "-netdev socket,id=3Dstr[,fd=3Dh][,udp=3Dhost:port][,localaddr=3Dhos=
t:port]\n"
>      "                configure a network backend to connect to another n=
etwork\n"
>      "                using an UDP tunnel\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dinet,addr.hos=
t=3Dhost,addr.port=3Dport\n"
> +    "-netdev stream,id=3Dstr[,server=3Don|off],addr.type=3Dfd,addr.str=
=3Dfile-descriptor\n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using a socket connection in stream mode.\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dinet,local.host=3Daddr]\n"
> +    "-netdev dgram,id=3Dstr,remote.type=3Dinet,remote.host=3Dmaddr,remot=
e.port=3Dport[,local.type=3Dfd,local.str=3Dfile-descriptor]\n"
> +    "                configure a network backend to connect to a multica=
st maddr and port\n"
> +    "                use ``local.host=3Daddr`` to specify the host addre=
ss to send packets from\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dinet,local.host=3Daddr,local.po=
rt=3Dport[,remote.type=3Dinet,remote.host=3Daddr,remote.port=3Dport]\n"
> +    "-netdev dgram,id=3Dstr,local.type=3Dfd,local.str=3Dfile-descriptor\=
n"
> +    "                configure a network backend to connect to another n=
etwork\n"
> +    "                using an UDP tunnel\n"
>  #ifdef CONFIG_VDE
>      "-netdev vde,id=3Dstr[,sock=3Dsocketpath][,port=3Dn][,group=3Dgroupn=
ame][,mode=3Doctalmode]\n"
>      "                configure a network backend to connect to port 'n' =
of a vde switch\n"

While the option documentation is good it might be worth taking some
additional time to document the wider networking stack. It is a topic
that often sees confusion amongst users and is a complex area of
functionality.

At a minimum a bit of preamble around DEFHEADING(Network option:) to
explain how devices and backends interact might help users understand
the context for the individual options themselves before launching
directly into explaining each one.

We also have some stuff on the wiki:

  https://wiki.qemu.org/Documentation/Networking
  https://wiki.qemu.org/Documentation/Networking/NAT

that might be worth sanitising and transcribing into a section of the
system emulation manual. We can then point to :ref:`networking` in the
options documentation so the user doesn't have to piece together
disparate bits of online information themselves.

--=20
Alex Benn=C3=A9e

