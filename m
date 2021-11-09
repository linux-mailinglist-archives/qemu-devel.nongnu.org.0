Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2049544B4B0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 22:28:29 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkYfM-0001t2-0m
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 16:28:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkYeL-0001D1-8y
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:27:25 -0500
Received: from [2a00:1450:4864:20::333] (port=42637
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkYeJ-0003v1-Hi
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 16:27:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so451738wmd.1
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 13:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6bJun1Ks1Jqg2Ni1KMRVBhgGTUu6xb5liVf4mjK1g54=;
 b=ukXFRwnTuR6QF2zUI9aj97h38d+T9D2E6WTKTjTUTg1UghDZkZSkucT+iVgt5pq1ez
 eYzjZd+hv1fiymV3R4JAGiX+qn7vommYFC9f4Pqt2Q/p2L2fg0Xqzx612lx2TcrrWuJx
 kBwERLBLxRRKhcJ6wZc1UDkWnPO3wyq9CHoIXJRSfYW5yB8/B7hbh4RGX0u7ZDSWNLev
 x/6H20sLXl4BTSJOJi0N+E1CmKmto3Ya65kAEE4X6S3M03DUMx84lTcfmEsRnunm5xR4
 4h8mqhnDIxz+nCHM6nY6rOdwtlmQImlri5wmCgMmK1WqgLtMiMqkNJraxGiJJyOI24Xb
 nXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6bJun1Ks1Jqg2Ni1KMRVBhgGTUu6xb5liVf4mjK1g54=;
 b=FsST96cMXmAlUc1SY1xUnzQmkFp7DZLoU9HGjBsd5tUCDH3CyYO4VgasScS6TnKe+j
 /QYuNryOlol8m++q54wUg6htvE4nwxmxUeuctmsWiQoCXPWCLRXOp8/jjAlia/UR0YJx
 f47ki79UNWWh4LBeTr1Um4LirzLW7Ar+3H/euq8GNAtYq6oi2R3Rqv+vTznw3jFUXl8t
 8yA4pAtkzxn6sMDlHBGkvalpNUzzjfZY0T8fNCAp5R54Pya77kG26kmzefTlH8DkNA35
 zhXM2V07dNIIAo5pDy+qTx6mtcKkIFuZHH07AeQjJnKndBkyEmrXegBLfQWfeX65IfWw
 E/PQ==
X-Gm-Message-State: AOAM532v5vlGGSnUNxNLS+tHGQJSYyyqLkMgPYe7dzF9arHIo6rrZjXR
 gHrH7GGCixHUHHB1twsm+FBFlSxFyX84Ain06xM/VQ==
X-Google-Smtp-Source: ABdhPJze5E4tT1ArJXKuTj6TMTrsjRIwWpZUfPMCmWlzUMh7PUljJ0KSOgwDKeoQK9s9X0WoTZIj+oMF2DfLpkeIHw0=
X-Received: by 2002:a1c:e906:: with SMTP id q6mr10858442wmc.126.1636493241899; 
 Tue, 09 Nov 2021 13:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20211109111517.996104-1-laurent@vivier.eu>
 <20211109111517.996104-2-laurent@vivier.eu>
 <9537b527-d33e-59d5-e196-e1e84fa01325@eik.bme.hu>
 <YYpvvWLvkhR0/igt@redhat.com>
 <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
In-Reply-To: <fa213548-ca60-bf7b-2075-83bd7f32462a@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Nov 2021 21:27:11 +0000
Message-ID: <CAFEAcA8yQ01RfaWCZO-qBd=quTYsMyTxfNsg0xbjRrzUb7LDJg@mail.gmail.com>
Subject: Re: [PULL 1/2] hw: m68k: virt: Add compat machine for 6.1
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org, Laurent Vivier <Laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Nov 2021 at 20:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> But maybe it's too late to change at this point.

Massively too late. We've been using this versioned-machine
scheme for over a decade, and the upheaval of changing the
way it works now would be rather out of proportion purely to
tidy up the list of machines in the help output...

-- PMM

