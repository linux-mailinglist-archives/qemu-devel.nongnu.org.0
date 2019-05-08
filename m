Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF616EBA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 May 2019 03:52:45 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57461 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOBlE-0006AA-3c
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 21:52:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55987)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgh8183@gmail.com>) id 1hOBjl-00053M-4v
	for qemu-devel@nongnu.org; Tue, 07 May 2019 21:51:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgh8183@gmail.com>) id 1hOBjk-0008FD-AN
	for qemu-devel@nongnu.org; Tue, 07 May 2019 21:51:13 -0400
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934]:38473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgh8183@gmail.com>) id 1hOBjk-0008Ds-5r
	for qemu-devel@nongnu.org; Tue, 07 May 2019 21:51:12 -0400
Received: by mail-ua1-x934.google.com with SMTP id t15so6792583uao.5
	for <qemu-devel@nongnu.org>; Tue, 07 May 2019 18:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=CMrooGSA9dBfel1NqKXx1DDSt0KGD/gUTuAQhMYnj1E=;
	b=AGK9KluUGzDA/gNOuwA8QEfTBiD4fRvBJ3Csf62bPCKpud9ZPatMhEy6gGXOO2USe+
	0HHMRruOmTNw2q09n0BWeG1wdWhnUyV60pFjaTnU5MBXisrcxV6FPFqGdUZyufTNohao
	Cn+9fomPq+j22iH/Rx8BYEsvog6tIqlHGVxAdFmTr93SzWvBB0NaY/IfT4D+KK4SZo9G
	YxHcjc8nuv3BE/2FLElQQppWg4/gxJBeaKm1ozKI3uqg/Ea5Qh8KSosZGZ4vv0wasN6b
	S5sANC56VsY8RjSGx/rksy5QAf11HC8SdJjs5XDmDw0YyfWGSl0X9QeJVZpKNb0WQnkt
	PZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=CMrooGSA9dBfel1NqKXx1DDSt0KGD/gUTuAQhMYnj1E=;
	b=QNbk4RqV1CsfkMG2zS4nQA61DEaRdLjTTeHyJJASZGthDlFSYjyWsfY+8NX14KTg2V
	za4TsYS5f5p7YSJyuGD11cwXVlfMW+TtJp8drasJSizu8dgFYcoURliJclwmuIO3Dbpv
	RebBGYC/75Q92k1xgf5sB4J00C5wyc9sfYFTEouP5DXBNYZUCi+9NRgMFOyGyhRL1JwR
	uDzPpGISJVdKEls1yfdxLcd5tfsafREoxNVeibOz7AU/XFhHyDVZ5aF05MMlxR+xRBBT
	a6nx9NUZM7+PvNdTbOFYWuNLdAbP36oEGCFr3pTX/U1LSmPLAl4ZtSDnk3HqGuPXtOfW
	kkKQ==
X-Gm-Message-State: APjAAAXVUTqN1YwzPuDVQf/WNy869BHwtwy0RmRrMq2ZXUvKyNxawv1k
	d41XzSTIPF0YtTZjyuTLKeymkPkiac3RMs9pmMxdTlEWowU=
X-Google-Smtp-Source: APXvYqy23Z9eK3CfTTOYBTSvNk0W81k73hQx70gGck2IaIFXB7k7uxedFOwhKNzt1JQynOGKaBzmlT4Jvk/pFeApP60=
X-Received: by 2002:ab0:14ce:: with SMTP id f14mr18532634uae.50.1557280271037; 
	Tue, 07 May 2019 18:51:11 -0700 (PDT)
MIME-Version: 1.0
From: S KH <sgh8183@gmail.com>
Date: Wed, 8 May 2019 10:51:00 +0900
Message-ID: <CAE519-=VsRtsLhd9T-RWSV-29yGz_0Zp7-TdMfXKcrV1wN0GWg@mail.gmail.com>
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::934
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: [Qemu-devel] Question in QEMU : The result of printf does not
 appear in the qemu VM's log.
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello.

I'am student studying QEMU hypervisor and SPICE.

In order to find out the calling order of functions in QEMU source, I input
and compiled 'printf ("% s \ n", __ func__) "into source.

And when I run the VM and open 'domain_name.log' in '/ var / log / libvirt
/ qemu', I see that no output from printf is displayed.

I installed qemu on Centos now, but I did not have this problem when I used
qemu in Ubuntu.

I wonder why.
