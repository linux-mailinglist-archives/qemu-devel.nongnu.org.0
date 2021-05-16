Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F3B381BD5
	for <lists+qemu-devel@lfdr.de>; Sun, 16 May 2021 02:35:07 +0200 (CEST)
Received: from localhost ([::1]:56826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li4kM-0002bU-76
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 20:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1li4iv-0001uS-By
 for qemu-devel@nongnu.org; Sat, 15 May 2021 20:33:37 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:42636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1li4is-0002Qs-Ai
 for qemu-devel@nongnu.org; Sat, 15 May 2021 20:33:37 -0400
Received: by mail-qk1-x730.google.com with SMTP id o27so2572653qkj.9
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 17:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:date:references
 :to:in-reply-to:message-id;
 bh=wHj9Lnko7W47Ees755Z8VL/1RvheO0k9bR6tnz+Ojf0=;
 b=rCfImRUo3KO9qWAjYh9qbrDqDZTVgcxPn6tgqQ5harcGH53gn4cNVFL+di/8zPhvX8
 8Envo+zERcpfR43Zn/A1tUidOpppY9t0BA3/FYRmmMoWXBAKfoenUX5udJZJpHlFgncY
 vTndySzUWLDm5mtD8z/3zVSdt1WAyBUv7YQkClndv4yVcxQ1HkBqD8sQeAlt3upcc1r0
 ffUPIeJo0Un9fkJDBWyHFUKAtFs/fqRftQfMHeweyh9P7eoyxu2+lhw2GstQaHPzKhVj
 d0O86ClZJtfE2VYooStlNiPSvTIfGxC6xvspCU8XpquZfAmoSGLZnaBggKhfBDPLzqRX
 rjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=wHj9Lnko7W47Ees755Z8VL/1RvheO0k9bR6tnz+Ojf0=;
 b=M33UP0icPlfVjaorQUsMZ6PdOPwHOI1/UFuiyX+OkaGR4atuC/+il1luITB2O3PZBR
 GvuWMFR6zZgeIb77U8wQAJsLeSggbAUGB3x5HZtTVAACrh4JlijExELTrmoo0jU2bsag
 9X2H2IzHRAyUeyMYcdEUTg2uYhtp4dSllHvC8llvdf4urbP9+d3kd2/820jtlNkYF5EB
 XS8J0d3tOHneLvYjmhUpxQkZMfTghEkvyK/rnA8axuaYNfaVu0PiMjoDMzsbQksy8VTa
 /7I2mSZpPvTn08iKrZAqe2PeR1aA9Ne52ZnhQ/Wgrwa422bMRX6hipsEZ4XJVcRLTrqF
 u7nQ==
X-Gm-Message-State: AOAM5305rJx/1MN1u3tYm8vIFF/YidhVxVYLk21heS6pZwO+39UOTkiA
 8sOfJVbl6OzlOdENva/LCI8=
X-Google-Smtp-Source: ABdhPJykvW54Rj99GAMj9kziY9KFnNrMAS48zwN7VzHJaN9nl7fU5DGUDyr0xNxN5AJ3UA9PA/iLlw==
X-Received: by 2002:a37:9ac1:: with SMTP id
 c184mr51153869qke.201.1621125212838; 
 Sat, 15 May 2021 17:33:32 -0700 (PDT)
Received: from [192.168.0.6] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id z187sm7647412qkb.129.2021.05.15.17.33.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 15 May 2021 17:33:32 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: Mac OS real USB device support issue
Date: Sat, 15 May 2021 20:33:31 -0400
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <CABLmASFvmdSBP=z8L=_wrfz1FO2T08+Q+A8C4=WmhhaQTu9R3Q@mail.gmail.com>
 <CABLmASEDhvb1Z3YhLoxF4D0BFrcxmE7tNafei0RJ5KwVM+rj9A@mail.gmail.com>
 <F6C716CC-E058-4C70-A06F-FC0655516A1D@gmail.com>
 <CABLmASEPFVDejmfJw-Ak1_veREySYv8F-+ZKW_S2cDsEbfu7Gg@mail.gmail.com>
 <8827217c-8fee-7845-045-16ff9622d90@eik.bme.hu>
To: BALATON Zoltan <balaton@eik.bme.hu>,
 QEMU devel list <qemu-devel@nongnu.org>,
 Howard Spoelstra <hsp.cat7@gmail.com>, Gerd Hoffmann <gerd@kraxel.org>
In-Reply-To: <8827217c-8fee-7845-045-16ff9622d90@eik.bme.hu>
Message-Id: <833CA480-8C78-4029-A999-505698ACB297@gmail.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=programmingkidx@gmail.com; helo=mail-qk1-x730.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


I just wanted to give you guys an update on this issue. The libusb =
people have fixed the issue with USB device driver detaching on Mac OS. =
Here is where the code for the fix is located: =
https://github.com/libusb/libusb/pull/911/commits.

I was able to build the library and connect it to QEMU on Mac OS 11.1. =
As I write this email I am listening to mp3 files on my Mac OS 10.4 VM =
that is using a real USB sound card. It isn't perfect sounding but =
definitely a leap forward from where we were a month ago.=20

To download each commit in patch form, just append ".patch" to the =
patch's URL.=20
Apply the patches one by one using "patch -p1 < patch.txt".
Then open the Xcode project file and build the libusb target.
To locate the file I had to use this command in the terminal: cd  =
~/Library/Developer/Xcode/DerivedData
Then find out the path of the old libusb being used in QEMU: otool -L =
<QEMU's path> | grep "libusb"=20
Then to have QEMU use the new library file, use this command:
install_name_tool -change <old path> <new libusb's path> <QEMU's path>

Please let me know if you need any help with building your own version =
of libusb.=

