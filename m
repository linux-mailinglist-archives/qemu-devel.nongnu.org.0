Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFCD54FBFE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 19:13:59 +0200 (CEST)
Received: from localhost ([::1]:57974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2FXi-0004oo-A1
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 13:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2FVd-0002pV-4E
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 13:11:50 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:44968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o2FVa-0004Ad-Tk
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 13:11:48 -0400
Received: by mail-ej1-x62e.google.com with SMTP id kq6so9905611ejb.11
 for <qemu-devel@nongnu.org>; Fri, 17 Jun 2022 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=a7+O8RNLYCbgjD4Xss4M982tTFeiaAo+M5iYc6twl+o=;
 b=4G3skO3QhH0ODZkpY6+RL1/gTn331gudtGHDVrO6xSIZ4vc53FlmcusaPYBwntzQXY
 vbqKyffjGiFk1zRqZx8tMXwmpJC7WSeZv+93Z7XMvmmT52bDvvnSCW+vINaUL6Kr+1XZ
 MLDbnABdJByXGzIjeJ3ZbyfwXOGWRBQAmp04dS+wN/AJhozTusuPWk2fk1tSeGdcSF27
 UVpAjNNqxIOcGN5EyehdE6iYzJzBxBYl4+Pdn+kEIJxD/WfrjTYZXdh5xT630BUws5wK
 2TaAluupq9VFFi92OWvNTke0m9Bi4d7fZsOpgM6k4Jo4etn88Nc/2MFY4TdgCsjiHEuX
 b8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=a7+O8RNLYCbgjD4Xss4M982tTFeiaAo+M5iYc6twl+o=;
 b=Y2hBC+SEtOOs32McJLCh9tIu+tcAwcz94OACxSYoSlvVfkB9wm2qaAmuB7/X1C+Noo
 2Py5/+Qwy8XH4xn4b7IztpGxjVHGMB8oOGYcrDqxdtC7gywzdLVFoZWR5yr06kqtaiEA
 mAcvL9+5WRcCdyjuMZBSp8Aix9WPHW44aKfZpPmofyEH3dTRgD/VJwYm/51Ia+n2Tsqd
 MaJD+FvVC0aPxK8agJKXeWx86+oxyqMM8eKf7OkUnFZet27g0SwjN2+ojHrJX8alkPuu
 nfxhI0zia3a60vW8XoqJx6AlUJbvXM7RKKfTL3ZTt7ZZ92xHklti+0/9BS7eIR+tTCjB
 Ahiw==
X-Gm-Message-State: AJIora+KrApJsD0+5JEXKZZDkkGJekxxBu0IdyMK3f1R7WONtAs0MClF
 q8CkB5eZqHYq4B/+KLcTgiKitH7JhBHzFW7VVVcEgNHH7LhwMuFg
X-Google-Smtp-Source: AGRyM1tXjkYqG5QdeeigK48EETQdPgvnM7lCsa5e50eNLbnERRcA1FFcqQ7O4JcIR0sYnNBIdZ1JG9gWrirmtkdnjCo=
X-Received: by 2002:a17:906:c834:b0:6ff:4275:1e4e with SMTP id
 dd20-20020a170906c83400b006ff42751e4emr10013011ejb.121.1655485903160; Fri, 17
 Jun 2022 10:11:43 -0700 (PDT)
MIME-Version: 1.0
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 17 Jun 2022 22:41:32 +0530
Message-ID: <CAARzgwxLQt13Ago2jDSr4oqkrP0DHzjO8HP_wotwxnmi-=Wdmw@mail.gmail.com>
Subject: A new qemu acpi test with bios bits
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::62e;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi :
I am trying to write a new ACPI/smbios test framework that uses bios
bits (https://biosbits.org/ ).
This test will effectively:
(a) use a pre-built bits software zip file kept somewhere (where to
keep is TBD).
(b) unzip it.
(c) add a python based acpi and smbios test script to the unzipped
bits directory.
(d) make an iso out of the directory.
(e) spawn a qemu instance with the iso. The iso is built such that it
runs the acpi/smbios tests in batch mode. After running the test, the
spawned instance is killed automatically (vm shutdown).
(f) Collect the logs the vm has sent out.
(g) look for test failures.

My question is, what framework would be best to achieve the above? I
looked around and it seems closest to the avocado based integration
tests. I do not think it is qtest and qtest backend is not required
here.

Suggestions welcome.
Thanks
ani

