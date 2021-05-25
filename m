Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0B38FD0C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:44:21 +0200 (CEST)
Received: from localhost ([::1]:36192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSfk-0006Jn-3z
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshanavkis@gmail.com>)
 id 1llSe6-0005JD-E3
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:42:38 -0400
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35]:35808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <harshanavkis@gmail.com>)
 id 1llSe4-0000tC-UO
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:42:38 -0400
Received: by mail-vs1-xe35.google.com with SMTP id x22so7637064vsn.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=yVA7Uz/FU1i0tatrf17WoIF1lhnNKV18G/EvHFM6N2M=;
 b=X33tSHXH+KwdmPgTgy6Mpo4mXy5yL15IA82PSk0mkxYxtfGRYsVCYmYCelhAcck3Cw
 249KdSzF1AHtLK7TbJMsqIQqV1FE+lDcqx9W4peq0qs5kbmDK4BNS4ge7XyxNPw93KCE
 wg07BJyaEy5aB7QEgX4EkrWzTOqnVy0Q2ZhGGAhcP0LId429/SZRRoDBkRoBabEriByD
 XSl6jydWuXsPvXoHs2NTVW31sqBLb62gx6Qmdu/yy+6we9pyF6XXWAOnAZNhSrH023aQ
 ItLa21EVGV53vvAKCCzw3+xyeQZob3ucCReXkSGHVmEgNv4o0c+8J8p816if9IwyJ4HJ
 nuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=yVA7Uz/FU1i0tatrf17WoIF1lhnNKV18G/EvHFM6N2M=;
 b=FGuxdCG+YhrO9NJxF7tGVeXp3iEXL+jteMYBhglwSLCqXgj1uuwAuKgjhjAgeos9zN
 2nYT1QAP40+A2vTG3WeSJ4wAZeZPQMxTeYnS1UYkH1lgoUA3FWGpvSxWxdp3G72+S/7L
 ykKraEBRLfFD6yHe1atZL78mY40jhG79SITnA3mJX9q4VvHUzIVtcnQIl3Ux3s/A/6yl
 VmJBLRBxunv/tryRnZ7t7DxRireXDRmF+H8/Nl000Ff/HRswtGS9lV+TpZzN+rCq74II
 qOdJ5MONP6Ak551H6Uz0hE6GZkXvLqDfNQ7k+StFt+A7RELsVXO62T7WFxCy30znUXQN
 +Dew==
X-Gm-Message-State: AOAM5308mBEKg8Un6jCQjQNhzJsUt22pXBCI0p8Au5REPLOL8tCoj4bv
 w0Aid2oVihWHOG2c6zzsjr9SbNU1+E2u6FwdVroPB/nOSUv6Og==
X-Google-Smtp-Source: ABdhPJxUesZyvHUEf8mZewKmQNuTQaypcbXd9meHKxSzeQSmlaysWbNuggZ2phHQoBX8jJrSKIeX9v9h+OH4HFmPVJo=
X-Received: by 2002:a67:ea59:: with SMTP id r25mr22782341vso.24.1621932154862; 
 Tue, 25 May 2021 01:42:34 -0700 (PDT)
MIME-Version: 1.0
From: Harshavardhan Unnibhavi <harshanavkis@gmail.com>
Date: Tue, 25 May 2021 10:42:24 +0200
Message-ID: <CAHpcaiR8X1GsbNwB95fK25rEZb3CZ6rY4nmHTGZKQsojU-GhmQ@mail.gmail.com>
Subject: GSoC 2021: vhost-user-vsock application and Kata Containers
 integration
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e35;
 envelope-from=harshanavkis@gmail.com; helo=mail-vs1-xe35.google.com
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

Hi,

I am Harshavardhan Unnibhavi. I am one of QEMU's google summer of code
students for this year. I will be working with Fabiano Fid=C3=AAncio and
Stefano Garzarella on developing a vhost-user-vsock application and
integrating it with Kata Container.

Kata Containers leverage virtio-vsock to create a communication
channel between the runtime in the host and the agent in the guest.
Since, Kata Containers focus on security moving this device emulation
into an external user space process is very attractive. Hence, in this
project, we aim to realize an application, written in rust, that will
leverage the vhost-user protocol to emulate the virtio-vsock device in
an external process. This application would then be integrated into
Kata Containers.

I am looking forward to working on this very cool project! I also look
forward to learning from and interacting with the community.

Best,
Harsha

