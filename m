Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BB52BA621
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:29:22 +0100 (CET)
Received: from localhost ([::1]:34906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2jJ-00063h-Qx
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kg2iI-0005WW-Ea
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:28:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1kg2iG-0006Ck-8u
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:28:18 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 1so9179303wme.3
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 01:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=p7Ds4/WhKiWLYsgKVgfmPCW8up+dmct0Vr9JtSGgVcQ=;
 b=jG9xkgydM5/xXCeFGgPqVH38krw3Q5UKTr35mmAo/pYHyVNdKCWsOa7DLxRuPp/Wvh
 9m1JjNjQome2F0SqOts9S77HeH13FnzpFhyaMQH/2vJ09znP2wgdInCljtfoRzeEZrLN
 v2z8RrM8/1ghNUEgppglMT4nLCgYLB2vC2WHVEVOPY3D3Bp7u7D1ho+ErI5lRuwGcDEi
 Vk4+xaIW6/Lo/6zVFwkbbH18aUbCdSLBVChlX9VNYlOD+XLZ+cX5pIe3dE/MzSp3fp2/
 gYLJuUUdoNcGVUoY7BnnHd5jSXsJtkHrsSYAKqmo7c5gpfCuFp1oep6aDqR5q5XQPN9y
 RCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=p7Ds4/WhKiWLYsgKVgfmPCW8up+dmct0Vr9JtSGgVcQ=;
 b=IM0JW0NzHsKoNVQpHq6Yoa6kn+aRmClMScnyUzqbqi3WFS3rSUxWYJlNbsyjuJrbel
 h2h+55+YZnoGO5dGQXMxnHBHU6a35evb8O+kQULFKO7oyABWMRGwMoUEcCEF8/8N14RH
 /wUcEmAC1FbK5+WfB9HSVyCiV6efPMlvWGOJdBhC9Tz+SXiRgwuq4nsfwAiU7Lezr6Fa
 EeuGSGIHFdKx1PnzWqupMHRl/K/2qulOMLxkQ/5WbXZp6oPY30mWkt7RZ8+hnhWlo4yY
 ydjvmCsUUJoyq2O+9x1zdOwGkc1iKLDQaAeHF/VcFCTTwWEEjY2HQeIS69NhfpSqbe83
 Swpw==
X-Gm-Message-State: AOAM532NV01lWJICObIa6WHXbMlOAR+4wg3UayAipLoKt3jzba4r081w
 fhC3JuGDNUuSr8cNvr5ZROkBiA==
X-Google-Smtp-Source: ABdhPJyM9KwR4sM3cAV+NuU+o0d/VDVyGM3Wp84R2HBibK/paGTKWQrdfI9NcWSC8Qtbiby1suGH7g==
X-Received: by 2002:a1c:21c1:: with SMTP id h184mr9322253wmh.106.1605864494560; 
 Fri, 20 Nov 2020 01:28:14 -0800 (PST)
Received: from wks.local ([86.120.180.222])
 by smtp.gmail.com with ESMTPSA id o4sm3703197wmh.33.2020.11.20.01.28.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Nov 2020 01:28:13 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Peter Maydell
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <a0f17e81-5113-2e49-4275-f70674c6edaf@redhat.com>
Date: Fri, 20 Nov 2020 11:28:13 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5AE18AC-C0F7-46AD-996B-7CB65403ECEA@livius.net>
References: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
 <1C01B0E2-8730-40F4-8C75-B8FE3E851747@livius.net>
 <a0f17e81-5113-2e49-4275-f70674c6edaf@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=ilg@livius.net; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: cavinnarsinghani@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 20 Nov 2020, at 10:54, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> new m1 ... Richard Henderson and Joelle van Dyne are working on it

Ok, it's good to know that someone takes care of this.

Personally I think that the new Apple hardware is great, but to match =
developer needs it might need a few more months to bring up all =
necessary tools, QEMU included.


Regards,

Liviu


