Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D019359FCF
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:29:07 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUrC6-0002Pv-7R
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mgladouceur@gmail.com>)
 id 1lUrAk-0001eZ-OL
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:27:42 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:44989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mgladouceur@gmail.com>)
 id 1lUrAi-0004sC-Qz
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:27:42 -0400
Received: by mail-yb1-f172.google.com with SMTP id l14so339318ybf.11
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=DZGGimRq2kK1zMp3t5jqRY/YwBDdOnHjkA3i9lm24pg=;
 b=EEeXgQBYZHY+QWlZAKtgMOW1jfCo1ldbEut3PwuH79O71OoqyqdQA30+6uYRPE5ovf
 D0aM9/mCii3Zw8tSAWd+Gb3kpa2UR8oLjQ+CnxYkllJEVM8pA/Y0gY/RqBU6bmVTBu8K
 YnLd+vvjw0OuHslpr3N7PKeYfbvVw0/7fKg16kLPy7EfeCLB5eRXjsEQ9wGwlizODw/z
 n0swNvn9wbUOxHZXTU5l6dTNW2ls2TLYriXlC4yacCHDid8Kl5GsExcQkuWtMYQN2Gkb
 OLUlfWqOdGdYOesE/aWEDfwEn1wa407EDwuxnKKK9x24kd4b592JmrUx3TDAB5pysgsl
 fOVg==
X-Gm-Message-State: AOAM530dPF0oV3JvLa9dQslBiFOoVwdyX/kDuV43TB5/edgYBouLfFPD
 dQumXjSswZ/NfSRrWRVs0SaPbiaQ3MBf1rn0EbiacJJdX+3VEQ==
X-Google-Smtp-Source: ABdhPJxGDraGv8xJcGd91Xqm2qbVBmxUaj6kAVVxPClL+eFlsV6+NAGGb7RY6wAmKO/E1z8RU4CwHl4APevrHhLW8Is=
X-Received: by 2002:a25:7653:: with SMTP id r80mr19230498ybc.283.1617974859074; 
 Fri, 09 Apr 2021 06:27:39 -0700 (PDT)
MIME-Version: 1.0
From: Mike Ladouceur <mike.ladouceur@live.com>
Date: Fri, 9 Apr 2021 09:27:28 -0400
Message-ID: <CAHC8f_edLsS0QZhzP6HCEz_bP_pQaVrN7Kw9FBU-bwcCSLybUg@mail.gmail.com>
Subject: [Question] Binaries of virtio-gpu-wddm-dod?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bb137d05bf8a2003"
Received-SPF: pass client-ip=209.85.219.172;
 envelope-from=mgladouceur@gmail.com; helo=mail-yb1-f172.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000bb137d05bf8a2003
Content-Type: text/plain; charset="UTF-8"

Hi, I'm wondering where I can find binaries of virtio-gpu-wddm-dod to test?
I tried to build but I guess I'm running too new a version of Windows or
VS/SDK/WDK? I've seen mention of prewhql ISO's with binaries but there's
never any links? I understand it's in development phase. Thanks!

--000000000000bb137d05bf8a2003
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, I&#39;m wondering where I can find binaries of=C2=A0vi=
rtio-gpu-wddm-dod to test? I tried to build but I guess I&#39;m running too=
 new a version of Windows or VS/SDK/WDK? I&#39;ve seen mention of prewhql I=
SO&#39;s with binaries but there&#39;s never any links? I understand it&#39=
;s in development phase. Thanks!</div>

--000000000000bb137d05bf8a2003--

