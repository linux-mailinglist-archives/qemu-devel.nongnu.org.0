Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A433B0C91
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 20:09:34 +0200 (CEST)
Received: from localhost ([::1]:55198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvkq4-00070N-K4
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 14:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lvkoR-0004cO-4R; Tue, 22 Jun 2021 14:07:51 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:41914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joannekoong@gmail.com>)
 id 1lvkoP-0003Fi-D7; Tue, 22 Jun 2021 14:07:50 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ho18so35894428ejc.8;
 Tue, 22 Jun 2021 11:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=tjlPjMlIUtPNuahzVw0dKC/CzqRxrOYdalEv32cvWWc=;
 b=J3T7zFYQs6HW1lkccsRDRGHELavyWtjYZrGd8xsAig2naGL3gQgP7JUtLe799Yps6M
 1War2AGgErDTQ5SUrKGoF9xuqpKkqYWg4yTybOSqnycucV+jkTc3qnW0sR1AAkOMOGXm
 kxMOzrOxIkkUbHE3EiGNhETBX7b1D9Fqn+qXG++ytPL6UVawMCN7lMWj3TjaFXsh4p5B
 wpfOxe0HsORWJ5LqAL/oLlbJOQ8VP967xlLdP88tPTzTYzjOhQ19QRHi7BRMb0ku7pSo
 IsrvbexjGPzvVNknO+JsptkhOj3SGqTwB4+8FWV6LxUP3Tzwme9duGk/19bBKNr5JXcn
 JHXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=tjlPjMlIUtPNuahzVw0dKC/CzqRxrOYdalEv32cvWWc=;
 b=KlnbyO3O5lgaRAquZdZVTlmrj3GWngl8FyV3vg7DXLM8HBdBoOo7HmnJ0FXhoVEcfH
 otTNoa1sAwFNL2fvVRij9snmn2OwG+9z5ZMJI29Ub005xmkjXHHyDXUJP6GU3hIsmX3j
 SZ/2T6NGeZXTHaR6vGtIXXTAwpxl2gycHV+A9yUhZug3h1btBjDk88TFBYrLC112PFge
 XVMBv4+Nv3Gct1DXRqFBjVyGt2kjBYLv3Z7FspAS9fDkkY3wpbx1FfWcwOC3GjqWq4b1
 BTAqPAuEEnuXpgZ52s/D/qGLe6Uiu/MSAmeCC14qu2EMurVzrvp2Jifu+dne4y6hDTva
 lhsw==
X-Gm-Message-State: AOAM533OFiOjiAiOP92OoHocCUROwdJu1CR96bosvLk42bcpB8y5cVR8
 scEk9iDo7dIDC9WQKO5yP/4iLNzfpLnKO39UGi0MrvA0MEHYHQ==
X-Google-Smtp-Source: ABdhPJzvMit2G9y4lUmSnnmjLUh9MvJq8Wl3j3+F5BDpQQng0nL7Avto3/35QqntoR313p/7usqK9rFJSuPOV/bXJ4s=
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr5408098ejc.389.1624385265927; 
 Tue, 22 Jun 2021 11:07:45 -0700 (PDT)
MIME-Version: 1.0
From: Joanne Koong <joannekoong@gmail.com>
Date: Tue, 22 Jun 2021 11:07:35 -0700
Message-ID: <CAFAxGOcxET9j7VkDmcmUXmx3t9eSAM2a5RWSpCVmDfkOQPPfgA@mail.gmail.com>
Subject: SD/MMC host controller + 64-bit system bus
To: qemu-block@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c108ec05c55eaa58"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=joannekoong@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 22 Jun 2021 14:08:37 -0400
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c108ec05c55eaa58
Content-Type: text/plain; charset="UTF-8"

Hello! I noticed that the default SD/MMC host controller only supports a
32-bit system bus. Is there a reason 64-bit system buses aren't supported
by default?

Thanks!

--000000000000c108ec05c55eaa58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello! I noticed that the default SD/MMC host controller o=
nly supports a 32-bit system bus. Is there a reason 64-bit system buses are=
n&#39;t supported by default?=C2=A0<div><br></div><div>Thanks!</div></div>

--000000000000c108ec05c55eaa58--

