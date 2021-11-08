Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3C9447F41
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 13:05:44 +0100 (CET)
Received: from localhost ([::1]:49104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk3PD-00025n-E1
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 07:05:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3Lb-0000LP-Ue; Mon, 08 Nov 2021 07:01:59 -0500
Received: from dormouse.elm.relay.mailchannels.net ([23.83.212.50]:39244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3LZ-0006uY-QL; Mon, 08 Nov 2021 07:01:59 -0500
X-Sender-Id: duplika|x-authuser|me@xcancerberox.com.ar
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 9FDDF401A3A;
 Mon,  8 Nov 2021 12:01:13 +0000 (UTC)
Received: from cloud.estebanecheverria.gob.ar
 (100-96-11-8.trex.outbound.svc.cluster.local [100.96.11.8])
 (Authenticated sender: duplika)
 by relay.mailchannels.net (Postfix) with ESMTPA id 839E8401A74;
 Mon,  8 Nov 2021 12:01:11 +0000 (UTC)
X-Sender-Id: duplika|x-authuser|me@xcancerberox.com.ar
Received: from cloud.estebanecheverria.gob.ar (cloud.estebanecheverria.gob.ar
 [67.227.157.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384)
 by 100.96.11.8 (trex/6.4.3); Mon, 08 Nov 2021 12:01:13 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: duplika|x-authuser|me@xcancerberox.com.ar
X-MailChannels-Auth-Id: duplika
X-Eyes-Keen: 477049341373b88b_1636372872887_829065421
X-MC-Loop-Signature: 1636372872887:3716353796
X-MC-Ingress-Time: 1636372872886
Received: from ipbcc2ffad.dynamic.kabel-deutschland.de
 ([188.194.255.173]:60278 helo=[192.168.1.216])
 by cloud.estebanecheverria.gob.ar with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <me@xcancerberox.com.ar>)
 id 1mk3Ko-0007Js-0I; Mon, 08 Nov 2021 09:01:09 -0300
Message-ID: <829e9ea8-b9e9-c2ab-972c-18440c0a2d79@xcancerberox.com.ar>
Date: Mon, 8 Nov 2021 13:01:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] docs/about/deprecated: Remove empty 'related binaries'
 section
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211105142656.145791-1-philmd@redhat.com>
From: Joaquin de Andres <me@xcancerberox.com.ar>
In-Reply-To: <20211105142656.145791-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AuthUser: me@xcancerberox.com.ar
Received-SPF: pass client-ip=23.83.212.50; envelope-from=me@xcancerberox.com.ar;
 helo=dormouse.elm.relay.mailchannels.net
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.06,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: libvir-list@redhat.com, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/5/21 15:26, Philippe Mathieu-Daudé wrote:
> Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
> removed the content of the "Related binaries" section but forgot
> to remove the section title. Since it is now empty, remove it too.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   docs/about/deprecated.rst | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 56f9ad15ab5..5e514fb443d 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -370,9 +370,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
>   this CPU is also deprecated.
>   
> -Related binaries
> -----------------
> -
>   Backwards compatibility
>   -----------------------
>   
> 

Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>

