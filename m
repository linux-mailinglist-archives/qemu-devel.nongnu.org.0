Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0B1483F21
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:28:16 +0100 (CET)
Received: from localhost ([::1]:58608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4g75-0002Xp-D5
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:28:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n4g6D-0001ei-Lg; Tue, 04 Jan 2022 04:27:21 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:43669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1n4g6B-0000kn-Oj; Tue, 04 Jan 2022 04:27:21 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MMGVE-1mmbFT1gm6-00JK9m; Tue, 04 Jan 2022 10:27:17 +0100
Message-ID: <d46faaf5-17c9-20e9-83e8-fb6bcd87ee67@vivier.eu>
Date: Tue, 4 Jan 2022 10:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/2] hw/display/vmware_vga: only show debug output if
 DEBUG enabled
Content-Language: fr
To: Carwyn Ellis <carwynellis@gmail.com>
References: <20220104091135.61226-1-carwynellis@gmail.com>
 <20220104091135.61226-2-carwynellis@gmail.com>
 <5be97a9e-8df4-621a-8875-56979448a777@vivier.eu>
 <5DC1E921-4166-45E4-8EBE-BA07A2708956@gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <5DC1E921-4166-45E4-8EBE-BA07A2708956@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pIeUMJ1rkPAXySetGsJRDYH8g7B5eG9SAiiDW99TvbsC+QOu/Yr
 mYdFSzKaeV/6wBHM6OyBSLA4aMNf4qbrbb0YGNZZepy44/13yP3d9VIBA/5KjrS9SEhM8B7
 /zjkrXxIChPlv448L3D0G0L6bQ83A8XBERre4zn6Y6zUwcvrARE8dYXR3ytNT9ngYg/HOwq
 bw2vA5R4avi1SaCwhYjBQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TxL0Yb6scZY=:FTuH8aW4biaun7iVSlzq4R
 +K/jFssxmp6am1uWInDPtsHw4hyXq99hTDcqeT/WmH50Mo9kHEc4VlEQt5R75Mtw0BKcVC6eh
 tBSVyrm6IjCifm1XKstptO94C2T69cjv8eErSGrM89QgpwB7Pq7kmQnMM2W6JAoASseFayHd4
 uPgpc1XCek42zEZuf1cECyIjjxTySSR/ikjz7WHbVt7XUfnEMz5eyLG4gU1b6azwOo3fqmtzB
 L8HCNmMYWsXIN/w9E166sA539fTTMUHfV0DltCeCg0VUAuIwkDDHqdrdmVRwhrA/idE+Ojpu+
 Y9FW529aBJkzeznlShVIFOUdMWsA8ynbX6CG4Ysvs/+eb9gbSlExoGQ/+QVjG9SCt4b2dFa5b
 oSl3bUmBdIWYM4aOGpvHTQfVjeNO+8DmkJaaXDSFHJ+vd+MT48GlzC7m3KLA3oLgYPYPRBsb8
 YJPvaVc+0lDdbt6W3r231MC8pFOgDpwPs0+uzclLOQY12XLR9yGHdxkAB5UN4XzH5FNW17OSt
 oyhjbarqMR9dt43U/3vDjy5l/kQDaGDu5CAhHeDovjOReyZxL2GNLNFVzWWkJMFrS3J+Br00N
 vG3n7CQHu7A0GTbmPoRge+PdGxF2EJ+0PtBGzitS+vZIGP7EtcRDZEPxv2sDILg3zTr9NsQW3
 ++8XS6y2swjC98lDFez7oG3ZJbbFA/gSQAHA6ZPTf2Suhazn8qgjOuWkhKLC13sUJNMs=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 04/01/2022 à 10:20, Carwyn Ellis a écrit :
> Hey,
> 
> Thanks for getting back to me.
> 
> Yeah will take a look and update when I have a mo.

It's really easy to do, see below for an example:

...
>>>   @@ -297,45 +303,45 @@ static inline bool vmsvga_verify_rect(DisplaySurface *surface,
>>>                                         int x, int y, int w, int h)
>>>   {
>>>       if (x < 0) {
>>> -        fprintf(stderr, "%s: x was < 0 (%d)\n", name, x);
>>> +        VMWARE_VGA_DEBUG("%s: x was < 0 (%d)\n", name, x);

replace it by:

     trace_vmsvga_verify_rect_check_neg(name, x);

and in hw/display/trace-events you add:

     vmsvga_verify_rect_check_neg(const char *name, int x) "%s: x was < 0 (%d)"

Thanks,
Laurent

