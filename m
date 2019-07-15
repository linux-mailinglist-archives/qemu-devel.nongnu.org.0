Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF58469F7B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 01:21:39 +0200 (CEST)
Received: from localhost ([::1]:44260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnAHq-0000Va-Ad
	for lists+qemu-devel@lfdr.de; Mon, 15 Jul 2019 19:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38100)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jidong.xiao@gmail.com>) id 1hnAHd-00007R-Sn
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 19:21:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jidong.xiao@gmail.com>) id 1hnAHd-0005fl-3P
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 19:21:25 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:33032)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jidong.xiao@gmail.com>)
 id 1hnAHc-0005eJ-Tx
 for qemu-devel@nongnu.org; Mon, 15 Jul 2019 19:21:25 -0400
Received: by mail-wr1-x434.google.com with SMTP id n9so18896973wru.0
 for <qemu-devel@nongnu.org>; Mon, 15 Jul 2019 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=xrzvaho3A7NJDnxvYTzF/283MeG9Dl/AO3DEbGN9Ayc=;
 b=eGLwWJlCz44ld2gJuZpgO326yoKTmeeO7/3MWXmOcAlq2pCCdl1WYdfrbfX01YtzNR
 v75liPpylmqKIjeAfjx2i+rHztDFIMTKnWTpHiif4XseTHWKsT7U+HdJnmaLCrEoZONC
 BCCWq7ks7wVqEMpsEggW87IJ5UUtlnVN5nraSRcVQckq0/x8oysB8ePphJFIn/ImXMw7
 JxeDqIp6MDOOuqNxdNbm0XLcgQjmRb2vzKoGvzgeEXpIv1vf0ITxM1mKI7WXWTL7xq4V
 ii2b4ajduyudvY9tdNIpzqxzRd/70lIQvS35kzXXoWeFBOfa7New69HR1gByQbh7GzfN
 RGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=xrzvaho3A7NJDnxvYTzF/283MeG9Dl/AO3DEbGN9Ayc=;
 b=cWqAeRie57NSM48PFtshbsgExqTHLlcHE8bSEa6a4MTSK4kQCXWeZkRmKADw145Hoo
 sp4xRZyuONbHDesFuW4egw6F0RiT0YxBTI5CGDOjiE+nZajNkfFSq9z9pgSuxuXfXWPh
 SBdpB+1KarB1k4OdcsSX+T82m3eT+PhMC+9RUvvoTsDhS3zc+nSPGZBuxZHEbojGe0FJ
 NdkRJTUYIKCgY+NKF6YDP9BbK08hEei5UL5zdMYFXPlf/FOJPip6X99PNf6mY0rtcalf
 qS6k5WHprfYuya1skCUC82YRPSy8sEfqjkR5AG+o7t8kp5mp4XaBZnXrzSSUXP+SIMIf
 OyFA==
X-Gm-Message-State: APjAAAV7qHEYgCeokNZj4X+5ZxUL9ZDG29noksaIQkcsQzfoNCsKirTF
 6KdzYbG+JUpAhx02r01XPgMBhfrB+USEO29FQec=
X-Google-Smtp-Source: APXvYqxjPt9pMo4QAskIWlD4YfWcoj/oDuie3QBw7TUjW2WsVBlpyjlzxNPMg6CvrhTuxQ5LdzVBwE22WNSxzbogz+A=
X-Received: by 2002:adf:f450:: with SMTP id f16mr447458wrp.335.1563232882993; 
 Mon, 15 Jul 2019 16:21:22 -0700 (PDT)
MIME-Version: 1.0
From: Jidong Xiao <jidong.xiao@gmail.com>
Date: Mon, 15 Jul 2019 17:21:12 -0600
Message-ID: <CAG4AFWb5M39RQS-x5Gz_xOMVHQ==u_HhZojunwdv2O+pvQG+Qw@mail.gmail.com>
To: KVM <kvm@vger.kernel.org>, qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
Subject: [Qemu-devel] Any function to access nested guest virtual address
 space?
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

Hi, All,

I know this function cpu_memory_rw_debug() allows us to access a
virtual machine's virtual memory address. Is there any similar
function that allows us to access the virtual memory space of a nested
virtual machine? i.e., L2.

Thanks.

-Jidong

