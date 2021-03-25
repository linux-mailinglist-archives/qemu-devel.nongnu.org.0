Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8AF349221
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:36:46 +0100 (CET)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPPED-0003mP-8L
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:36:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luca.bellu95@gmail.com>)
 id 1lPNm2-0004Lu-Gv
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:03:34 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luca.bellu95@gmail.com>)
 id 1lPNm0-0007dQ-Tx
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 07:03:34 -0400
Received: by mail-oi1-x22f.google.com with SMTP id x2so1714721oiv.2
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=M3uVLDrEcFAr3iyflpb5CN9iGv+zpYykkIYNTrCRgas=;
 b=QLNWQec+0mZnrMB+aPCqcsO3fPISd0CTbDgKGARiIEZiMb2z+DxeZMjRa1EWvoBWHS
 81wAvJ9d7uGGsrXZSSSj1CWt11HnqfviAO3GMyspglBmZM4PlY+Xe2WBU2yR6Moa5ERW
 kDc8JrYafW0zXWfDcUVYkNQYm3PqFAaUf68gWB6tLDmQtyc/JaX5gLyGVGvyyT490c/O
 UeX3tvUpdXj/hcGoIWcLNjJXK4LDMDSrwC1unFC/7N6TFB1wYyzvtYmJPaQrtS9HaeDb
 pVTANv19U1RhCb87qZsp13M56hBxiso/SfArM76eFIZQSZ1VVcLfauH7PPiEczwHcoU0
 ltDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=M3uVLDrEcFAr3iyflpb5CN9iGv+zpYykkIYNTrCRgas=;
 b=Ys3qc8DhcWutbSbLKWyTKzmA+K2d81nNHIAqp594ksvuVu9/nwB8AETeu/Iqrh1yMr
 0sqplAEZEcGwf19yEYyEEJDjF9mhH23ALhMWL61823N7QoLEEoykqDk0GrtFkRQOeM/2
 u02/kZt3Da86s3QwBGX9sF4oqZcUAsjFLv3vPk+2RESQKbXA/6TyVc9jqZ8KmWgZ6ll1
 3KwLQjULpZ7G4Q+h1vVPDiN+0ARvsPM6+GvaPYul9hZx3FzTDrWtIpV7FodKnY4et8DA
 0jEAGInVqlTMkck0vXmbcPM29ILA1/GUgj8f7FxC2FDhYUi7JQByX8ioxAivsVkE7pm5
 qfhg==
X-Gm-Message-State: AOAM533Maj+7bjC1R40XredvA+CGxcAZj4YaIiuH1ne/uBFlE/VIckpm
 KB3Ns6qHJZQ5XXMguNAbp55TsM6szXm7WHt3vMcQUHGY
X-Google-Smtp-Source: ABdhPJzPe7ucUt1BHV1380kpS3Q/S612vugi/9PvChsDnPE5Dy6cytixqvFiXNGAjbPrM5jy2tRacMZXuZxN2eEj+/U=
X-Received: by 2002:aca:4188:: with SMTP id o130mr5608857oia.101.1616670211300; 
 Thu, 25 Mar 2021 04:03:31 -0700 (PDT)
MIME-Version: 1.0
From: Luca Belluardo <luca.bellu95@gmail.com>
Date: Thu, 25 Mar 2021 12:03:19 +0100
Message-ID: <CAJRteMidw8Sfej0UkVg_0xvj29mDkUxv46LBg45tv2DHCOtjwA@mail.gmail.com>
Subject: Memory address of ivshmem device
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a9e04005be5a5dc8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=luca.bellu95@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 25 Mar 2021 08:32:40 -0400
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

--000000000000a9e04005be5a5dc8
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm using KVM from command line to run a VM and I have to create a ivshmem
between host and guest. The options that I pass are:
-device ivshmem-plain, memdev=id -object
memory-backend-file,size=1M,share,mem-path=/dev/shm/ivshmem,id=id
Now, from host side I can read and write the shmem. From guest not because
the OS in VM doesn't have a device PCI manager. I want to know if the
device has a fixed address on KVM VM so to force read and write to that
address in the application on VM.

Best regards

Luca Belluardo

--000000000000a9e04005be5a5dc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto">Hi,</div><div dir=3D"auto">I&#39;m usin=
g KVM from command line to run a VM and I have to create a ivshmem between =
host and guest. The options that I pass are:</div><div dir=3D"auto">-device=
 ivshmem-plain, memdev=3Did -object memory-backend-file,size=3D1M,share,mem=
-path=3D/dev/shm/ivshmem,id=3Did</div><div dir=3D"auto">Now, from host side=
 I can read and write the shmem. From guest not because the OS in VM doesn&=
#39;t have a device PCI manager. I want to know if the device has a fixed a=
ddress on KVM VM so to force read and write to that address in the applicat=
ion on VM.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Luca Belluardo</div></di=
v>

--000000000000a9e04005be5a5dc8--

