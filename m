Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D8B3194C4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 21:56:45 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAJ12-00082A-8c
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 15:56:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lAIrC-000752-Js
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:46:36 -0500
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:40060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1lAIr7-0007m9-9u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 15:46:33 -0500
Received: by mail-qv1-xf29.google.com with SMTP id v19so3229755qvl.7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 12:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vrtOq5RbhehWbDJFlXey5D27ZkTX3Q+FhxSuDHB4G8Y=;
 b=BiOE4VrzZpRqh5Jz51322CG3YP+Rx5xv6e5ZbpFFvTcXIRSO2Umlk84zg4q2o9XQY2
 gAuKFTS4M3tekjsk4B8iKqtxaUruJHYllfn20p17DsjdpJu5h5UetBDDkNKvrAOGe3Zb
 lFQcgjLRYf5n/22MMhsDP0jlrnquBz7ackBHpu2R1RU3uANEwl8VsJTmKTASjj6Z9RZj
 glH8MBWJ4uoUhTAbJhAvHHaJldKNtkmjmvtLDc8F9u3YwbziKtl6uCttLG01hzJR7VjG
 LeGwSPykD2WDipPc3nZIYWS0QGFiD7bdoXdz6atlRtPN3xgsSZ7QM4C6WmeqRaZNKwyg
 rv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vrtOq5RbhehWbDJFlXey5D27ZkTX3Q+FhxSuDHB4G8Y=;
 b=l/gFBCAfZXdbmcgX7W1fKBb3piFZKEGWUYhutnT6Uo2DfWdkVo0McfCgD/EBW9PTOf
 LZuAJAU9u+MnObIrIWEbPHvLjmr/KAArQ2PDiI7hUnBGvqng3B3W80i8uQiJQF5vxFDB
 H1fy1plAMArMaZGDWi8TONI8cPFyodMVWGzYN1ouaWdzRs5fFzKsJD9LlxzJRCxmBDVv
 c1SSZ61EXqV0vJrar0bN0oGibWpW7etGc0sjtwX3dlfHIMDIJGoM5Pfmh7JFsdCfOnk4
 +WQ70J+N0dCc2YkOynNIOwbBCQ0AnsVHiRaVxW9pqPaEeNkWCpIRBpCgYvnAqRskbeOW
 ZJ8g==
X-Gm-Message-State: AOAM533jr+36sTLi0tc+9sAlYnnNlbpN4Mr4KxwsyMEL55u/gfQ4lMMN
 rjkv1LOcLJXHKfzeXhRzsAprBP0brQo=
X-Google-Smtp-Source: ABdhPJzKYCt1HryDCCWbnhFSA8aLXS7pi02M16T5Jh13AZMwyc+U70JmNYa6YkeYRCntIU0zc/m+LQ==
X-Received: by 2002:a05:6214:d6d:: with SMTP id
 13mr9754509qvs.60.1613076384210; 
 Thu, 11 Feb 2021 12:46:24 -0800 (PST)
Received: from [192.168.0.4] (d149-67-30-58.try.wideopenwest.com.
 [67.149.58.30])
 by smtp.gmail.com with ESMTPSA id u45sm4421997qte.3.2021.02.11.12.46.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Feb 2021 12:46:23 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: USB pass through into Mac OS 9.x with qemu-system-ppc
From: Programmingkid <programmingkidx@gmail.com>
In-Reply-To: <mailman.2361.1612790999.21101.qemu-devel@nongnu.org>
Date: Thu, 11 Feb 2021 15:46:22 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <FFC6A29A-5635-4780-ADFA-665A0A2C2B58@gmail.com>
References: <mailman.2361.1612790999.21101.qemu-devel@nongnu.org>
To: qemu Developers <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 8, 2021, at 8:29 AM, qemu-devel-request@nongnu.org wrote:
> 
> Message: 15
> Date: Mon, 8 Feb 2021 14:29:06 +0100
> From: Howard Spoelstra <hsp.cat7@gmail.com>
> To: qemu-devel qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann
> 	<kraxel@redhat.com>
> Subject: USB pass through into Mac OS 9.x with qemu-system-ppc
> Message-ID:
> 	<CABLmASF7YP3qfcuhAQsm8J28e8omZstBf7E5Eir=8MyqnvPLRQ@mail.gmail.com>
> Content-Type: text/plain; charset="utf-8"
> 
> Hi all,
> 
> I'd like to report an issue when passing through an USB device into Mac OS
> 9.2.
> Passing through the same device into Fedora 12 ppc guest works fine. Host
> is Fedora 33. Both guests use the OHCI controller. AFAICT Mac OS 9 only has
> support for OHCI.
> 
> Pcap files for two runs are attached, as is a screenshot of Mac OS 9.2 USB
> messages from inside the guest.
> 
> A noticeable issue when comparing the pcap files seems to be at Fedora pcap
> frame 8 and Mac OS 9.2 pcap frame 28 (configuration descriptor). It seems
> the Mac OS side is missing 5 bytes and hence the packet is malformed.
> (A run with Mac OS 9.0 as guest showed that this guest only missed 1 byte
> in the response.)
> 
> Also visible in the Mac OS pcap file at frame 53 is that it seems a setup
> package is contained in an URB that is not suited for it.
> 
> Qemu-system-ppc is started like this for the Mac OS guest:
> ./qemu-system-ppc \
> -M mac99,via=pmu \
> -m 512 \
> -boot c \
> -serial stdio \
> -L pc-bios \
> -drive file=/home/hsp/Mac-disks/9.2.img,format=raw,media=disk \
> -device usb-host,vendorid=0x058f,productid=0x6387,pcap=macos92.pcap
> 
> Or like this for the Fedora 12 guest:
> ./qemu-system-ppc \
> -L pc-bios \
> -boot c \
> -prom-env "boot-device=hd:,\yaboot" -prom-env
> "boot-args=conf=hd:,\yaboot.conf" \
> -M mac99,via=pmu \
> -m 1024 \
> -drive file=/home/hsp/Linux-disks/fedora12.qcow2 \
> -g 1024x768x32 \
> -device usb-host,vendorid=0x058f,productid=0x6387,pcap=fedora12.pcap
> 
> Thanks for looking into this,
> 
> Best,
> Howard Spoelstra

Hi Howard. I suggest you make a bug report so we may track this issue.

This is where you would file the bug: https://bugs.launchpad.net/qemu/

I didn't know about the pcap option. It looks very useful.

Thank you.


