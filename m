Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C713283B3
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 17:24:49 +0100 (CET)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGlLk-00066N-5s
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 11:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lGlKi-00059j-0K
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:23:44 -0500
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30]:37126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dje@google.com>) id 1lGlKg-0007JL-8q
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 11:23:43 -0500
Received: by mail-vs1-xe30.google.com with SMTP id l27so1429537vsj.4
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 08:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAmb93mG7U34ObU6mGbY/PCMZO0VBA8Z4d6UyhLoifM=;
 b=RW0zn6TpVlSxPQYoksp0WCnYY3PuhsFPwDk2MqhFVhxZXSAuOcpVBwfa8wbRHBGKNI
 8X7dFh2ucN54S9QlgHtyGcrgoiGwtpHOwxA1mwRkYOErHEudsShpDwNx92NsV/1+PBRE
 iKDRR3/SfYknmFr4cbaITB6Ey4zoUkapPcEUFwPwG2kbJVvrK9ML6+OFu2FQ54AUPnde
 ewnEImkhFeeUu/SI3agBsKWjo7NcTSKxQlQ/xLO1INA1I05oRTrKBIfWIjAdaRsPftXe
 7+nUFpP4oxbLzaeAiOfSkWyuLRqRa2qUirHD6VLCqg8p6Lcu4vJdy2c2efXnslQ4gEOI
 GaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAmb93mG7U34ObU6mGbY/PCMZO0VBA8Z4d6UyhLoifM=;
 b=syF01/GSaBt35dUE6N5iNDJ03vJfKdr2JtsJveObb+2zFE9+YjEr3VYoVpQ4oi9N8s
 y2AwH0jDj7VWxKNCP0uDUcDGAxWTMIS0EdeqKjx/RccJQ6Pk/5PPiGq+DNS9qkUr4kA0
 F0xVzyXTvB0KOMV7uiDqpQq3gPVbmW7wyNvQeDol0T+gV8FKfy77ChSyIUQ/+JxWFwf2
 lL1aUWzFrG6J2tnHUTIw9DHq06mqsj7nLKT0ZO/kKnwVFPXmziLSozpO1dqnQLaptF14
 Wj1EqLXNVjh7J4igeya6ajTIb5TGWfCbIS+SshYj2AYH/HafjlzU9Vm1HQfxSLe39F7l
 aBUQ==
X-Gm-Message-State: AOAM533QhNyqTmzUdcR/qcpPRG0fEhiqjYM9r2u5hp2c/AO54vWe0REo
 /YWnWm4WGLoyPkvQ1FpXKyCrBqmSfyoyBf8AhLv2Xw==
X-Google-Smtp-Source: ABdhPJxD5qk53xW1xONoynd2UvR6QoHktDzSWtuQHmwLaAmU+pN8BfT3odTbAiMRuB0roQ3cAzhG9XVMM5L/HqeXcEQ=
X-Received: by 2002:a05:6102:b11:: with SMTP id
 b17mr8365984vst.43.1614615820932; 
 Mon, 01 Mar 2021 08:23:40 -0800 (PST)
MIME-Version: 1.0
References: <CADPb22TNebyiYxc+gtNFD+=CfwtWP4heSYt+_=uBcZAeWoWHXw@mail.gmail.com>
 <YDN73SqaDQDtwlgZ@redhat.com> <20210228213957.xkc4cceh5o6rgd5n@begin>
In-Reply-To: <20210228213957.xkc4cceh5o6rgd5n@begin>
From: Doug Evans <dje@google.com>
Date: Mon, 1 Mar 2021 08:23:03 -0800
Message-ID: <CADPb22RY3kT1U69M71+V2-azCwiLn=wm382KHswr2OZXDmZehA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] util/qemu-sockets.c: Split host:port parsing out
 of inet_parse
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000075371105bc7c0a40"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e30;
 envelope-from=dje@google.com; helo=mail-vs1-xe30.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--00000000000075371105bc7c0a40
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault <samuel.thibault@gnu.org>
wrote:

> [...]
> > Note that one issue I am leaving for later (i.e., I don't want to drag
> this
> > patch series out to include it), is whether and how to support
> ipv4-host->
> > ipv6-guest forwarding and vice versa. Can libslirp support this?
>
> That would be feasible yes: since the data flow is completely rebuilt
> between the host and the guest, there is no remnant of the IP version.
> It was simpler to have e.g. udp_listen and udp6_listen separate to keep
> uint32_t / in6_addr parameters, but there is no strict reason for this:
> the haddr is only passed to the bind() call, and the laddr is only
> recorded in the so. Put another way, a refactoring patch could be to
> just hand udp_listen two sockaddrs, and it will just work fine. We'd
> then introduce a slirp_add_hostfwd that takes two sockaddr instead of
> host/port.
>


I guess I'm not familiar enough with this code.
Help me understand how passing two addresses to udp_listen is simpler.
That feels confusing from an API viewpoint.

--00000000000075371105bc7c0a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">On Sun, Feb 28, 2021 at 1:40 PM Samuel Thibault &lt;<a href=
=3D"mailto:samuel.thibault@gnu.org">samuel.thibault@gnu.org</a>&gt; wrote:<=
br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail_default" style=3D"font-size:small">[.=
..]</span><br>
&gt; Note that one issue I am leaving for later (i.e., I don&#39;t want to =
drag this<br>
&gt; patch series out to include it), is whether and how to support ipv4-ho=
st-&gt;<br>
&gt; ipv6-guest forwarding and vice versa. Can libslirp support this?<br>
<br>
That would be feasible yes: since the data flow is completely rebuilt<br>
between the host and the guest, there is no remnant of the IP version.<br>
It was simpler to have e.g. udp_listen and udp6_listen separate to keep<br>
uint32_t / in6_addr parameters, but there is no strict reason for this:<br>
the haddr is only passed to the bind() call, and the laddr is only<br>
recorded in the so. Put another way, a refactoring patch could be to<br>
just hand udp_listen two sockaddrs, and it will just work fine. We&#39;d<br=
>
then introduce a slirp_add_hostfwd that takes two sockaddr instead of<br>
host/port.<br></blockquote><div><br></div><div><br></div><div class=3D"gmai=
l_default" style=3D"font-size:small">I guess I&#39;m not familiar enough wi=
th this code.</div><div class=3D"gmail_default" style=3D"font-size:small">H=
elp me understand how passing two addresses to udp_listen is simpler.</div>=
<div class=3D"gmail_default" style=3D"font-size:small">That feels confusing=
 from an API viewpoint.<br></div></div></div>

--00000000000075371105bc7c0a40--

