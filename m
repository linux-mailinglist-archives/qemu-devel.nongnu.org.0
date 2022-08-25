Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 566CB5A1D01
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:19:15 +0200 (CEST)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRM82-0003Ss-0I
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:19:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oRM4V-0001Ee-Ag; Thu, 25 Aug 2022 19:15:35 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:50893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oRM4S-0004Cg-GK; Thu, 25 Aug 2022 19:15:34 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 2E1693200A38;
 Thu, 25 Aug 2022 19:15:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 25 Aug 2022 19:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1661469328; x=
 1661555728; bh=NUIPg9ogfNOGhJkL2DfidK4zHCf8p39tlCHpNVNvSQw=; b=F
 a/+2sy3du2OURoGXlvujaBlP7qMiyCEa8MhLlT+P+yqPt8slSKHK4NAOKtWzWBww
 2l9y5t7ibu2YcKZ/5jMQyCArS4c3mHTQh31uYPHOpiydt6n0usfWZHhS89x0Unm9
 ULgfwAqOoTjt5XTcwiWx4+KdAohPaZMQh2tw170N/XGi/KuR8DOAHqcJ22lzDMDO
 d8ludwCkwNibr8AqoQXSm5ZMQmh+3iiX5CTmeFh38VjMeqIBJTRTCra1ck8ybpRL
 27Eh2c9Z2mJp6wu004SJjRnFs2Fq8s50umlYypg6qiBe/lWv2LPYu2Kv3H4Z0GM9
 pGqKjSB7WTesDk+aeYntg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661469328; x=
 1661555728; bh=NUIPg9ogfNOGhJkL2DfidK4zHCf8p39tlCHpNVNvSQw=; b=q
 eC21/5Low+FRXxRUAAmADfo8dWCZBqSdi9DxpLw55CGYUb47qcgIRWZ+1MuOMrqX
 qmA2aklTf1TZjj5z8AoAblRWQAaufHDFroDhK77J52dUF96X/7wkBiV+dJKqs/UN
 aWfhVdMKExTMQu/j9ot+528gAeBaDTVe6wWecfOVKxiP0AWRvTbxjLuQ9uPyUlC7
 9zajVXejomv3jqo69wuTeoZNFwPCcEfkVsOyQGcaDIpMvumb8aUaQEdp2osuxgLN
 U31ycIDbOGp+a4GPDcC3IMEMstc4Okj9uNpnScLXpkV4SXH/OV39w+X6pI7vH6hO
 VeSkNQmVnva2tzf/HUHMA==
X-ME-Sender: <xms:kAIIY9cyJs2_N8i_B1aKepivxnx_uH8ZQAzl8i0_HTBYFmjRrkXgBg>
 <xme:kAIIY7PrGkOlnqlTI_42i8TPXb7mjp8HmG8Hzj08dVgMoW8d70-3djVVoH-0f0s6-
 O4luIHK1kMxpeAuDwI>
X-ME-Received: <xmr:kAIIY2iFnTwMTpIHmUD3K7XFNMFxc_PB4B1NYf8Nqz9j0ywYbF1RW61rJ8szT2XjbScZzB71J4Td>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejgedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttddunecuhfhrohhmpefrvght
 vghrucffvghlvghvohhrhigrshcuoehpvghtvghrsehpjhgurdguvghvqeenucggtffrrg
 htthgvrhhnpefhgeffvedufeevteegkeetieejhffhudeujedvgedvheffheejveethffh
 ffefueenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:kAIIY2-psMWo5CXuMM-rLlRrWZLdVgWs_B53z-WVTU3yEvrm6Uamgw>
 <xmx:kAIIY5uiCZU_IBIoXAJHZlemQIjnv853IFfqWMq09D9Uy1JRM7BzLw>
 <xmx:kAIIY1Ea_O7TUyLpsWdzlms1wU0wl5z1VJ4HvNPP65dqif6BF6apww>
 <xmx:kAIIY3UPWrKPRs_m_CiK8nJP8zJPOsMEQTfgOPbAky36qPiaKZ8Zzg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Aug 2022 19:15:27 -0400 (EDT)
Date: Thu, 25 Aug 2022 16:15:26 -0700
From: Peter Delevoryas <peter@pjd.dev>
To: Samuel Thibault <samuel.thibault@gnu.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org,
 garnermic@fb.com, patrick@stwcx.xyz, zhdaniel@fb.com
Subject: Re: slirp: Can I get IPv6-only DHCP working?
Message-ID: <YwgCjqC90KhDKUnr@pdel-fedora-MJ0HJWH9>
References: <Ywf5/cIDTV8OQ/0d@pdel-fedora-MJ0HJWH9>
 <20220825225610.oio5h5bflp4gmaph@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220825225610.oio5h5bflp4gmaph@begin>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=peter@pjd.dev;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Fri, Aug 26, 2022 at 12:56:10AM +0200, Samuel Thibault wrote:
> Hello,
> 
> Peter Delevoryas, le jeu. 25 août 2022 15:38:53 -0700, a ecrit:
> > It seems like there's support for an IPv6 dns proxy, and there's literally a
> > file called "dhcpv6.c" in slirp, but it has a comment saying it only supports
> > whatever is necessary for TFTP network boot I guess.
> 
> For which DNS support is welcome :)
> 
> > Maybe there's no support then?
> 
> It seems there is:
> 
>     if (ri.want_dns) {
>         *resp++ = OPTION_DNS_SERVERS >> 8; /* option-code high byte */
>         *resp++ = OPTION_DNS_SERVERS; /* option-code low byte */
>         *resp++ = 0; /* option-len high byte */
>         *resp++ = 16; /* option-len low byte */
>         memcpy(resp, &slirp->vnameserver_addr6, 16);
>         resp += 16;
>     }

Well, that's great, but actually I just care about whether slirp supports DHCPv6
address requests. Sorry if I didn't explain that properly.

My goal is to run:

    qemu-system-arm -machine fby35-bmc -nographic -mtdblock image-bmc \
        -net nic,model=ftgmac100,netdev=nic \
        -netdev user,id=nic,hostfwd=::2222-:22

And then see that the BMC received an IPv6 address assignment.

But, slirp currently just supports IP address assignment through BOOTP?  I
didn't realize that until looking a little closer at the code. But, since the
DHCPv6 hook "dhcpv6_input" is already there, maybe I can just get something
going through there? I suppose I might need some IPv6 NDP packets to work too,
to ssh through a hostfwd port.

    root@bmc-oob:~# ifconfig eth0
    eth0      Link encap:Ethernet  HWaddr FA:CE:B0:02:20:22
              inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
              inet6 addr: fec0::f8ce:b0ff:fe02:2022/64 Scope:Site
              inet6 addr: fe80::f8ce:b0ff:fe02:2022/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:107 errors:0 dropped:0 overruns:0 frame:0
              TX packets:136 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:13316 (13.0 KiB)  TX bytes:10022 (9.7 KiB)
              Interrupt:33

Anyways, I'll do some more investigation on my own, thanks!
Peter

> 
> Samuel

