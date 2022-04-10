Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2EF4FAC1D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 06:51:37 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndPY0-0006dH-HV
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 00:51:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ndPWI-0005rI-AU
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 00:49:50 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:7048
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1ndPWG-0002Pu-0I
 for qemu-devel@nongnu.org; Sun, 10 Apr 2022 00:49:49 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4KbffP6v4sz8PbN;
 Sun, 10 Apr 2022 00:49:33 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=I7WpYIz96
 YSzAKW2tFVidOaePJA=; b=hG9qpM4/cpewCxhHEwE0rEVoeZsbVT0o39PTPkhOF
 WapZNTFD/4Q+xxKbQCWunfg3SMP9Cuy4Bwe862xdtKn658MM5iIKMTRIbWqjNBYz
 Fq3d85AhqIWCcQGC4RN8nOUT2G+J1UHlChnGN7F4PB31YEH60cU3kGCTqTSMw4ga
 og=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=hT2
 PP0TD8tb1q+O1okpNLWOOnLe8e5d/l2nSnTqLCCjrdA/UJq25I+naa2beTgDNmxQ
 0EeoFQzmnJiorXYqQA6vKjqchlQ5aAvhnQgJkoqbQnIRyL6M8PCltYyo987LOTmU
 d/Wls5wqAdRWtcAlGDAnaVKigU7nMLvPU66TMCsg=
Received: from [IPV6:2001:470:b050:6:100d:74ae:ae8c:ee48] (unknown
 [IPv6:2001:470:b050:6:100d:74ae:ae8c:ee48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4KbffP61D7z8PbK;
 Sun, 10 Apr 2022 00:49:33 -0400 (EDT)
Message-ID: <72fe734a-8bf6-adc6-474a-47f2006c2f6d@comstyle.com>
Date: Sun, 10 Apr 2022 00:49:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC PATCH for-7.1] Remove the slirp submodule (and only compile
 with an external libslirp)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20220408164749.534758-1-thuth@redhat.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <20220408164749.534758-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/8/2022 12:47 PM, Thomas Huth wrote:
> QEMU 7.1 won't support Ubuntu 18.04 anymore, so the last big important
> distro that did not have a pre-packaged libslirp has been dismissed.
> All other major distros seem to have a libslirp package in their
> distribution already - according to repology.org:
>
>            Fedora 34: 4.4.0
>    CentOS 8 (RHEL-8): 4.4.0
>        Debian Buster: 4.3.1 (in buster-backports)
>   OpenSUSE Leap 15.3: 4.3.1
>     Ubuntu LTS 20.04: 4.1.0
>        FreeBSD Ports: 4.6.1
>        NetBSD pkgsrc: 4.3.1
>             Homebrew: 4.6.1
>          MSYS2 mingw: 4.6.1
>
> The only one that still seems to be missing a libslirp package is
> OpenBSD - but I assume that they can add it to their ports system
> quickly if required.
>
> So there is no real urgent need for keeping the slirp submodule in
> the QEMU tree anymore. Thus let's drop the slirp submodule now and
> rely on the libslirp packages from the distributions instead.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>


I wish I had seen this earlier as our 7.1 release was just tagged.

I have whipped up a port of 4.6.1 for OpenBSD as it was pretty simple. I 
will
see about submitting it in a number of days when the tree opens.


