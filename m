Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FCCC957
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Oct 2019 12:22:14 +0200 (CEST)
Received: from localhost ([::1]:55502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGhCX-0003aQ-P7
	for lists+qemu-devel@lfdr.de; Sat, 05 Oct 2019 06:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41039)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1iGhBR-00034g-4X
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 06:21:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lucienmp.qemu@gmail.com>) id 1iGhBO-0004y3-QQ
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 06:21:04 -0400
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a]:39749)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lucienmp.qemu@gmail.com>)
 id 1iGhBN-0004xQ-9p
 for qemu-devel@nongnu.org; Sat, 05 Oct 2019 06:21:01 -0400
Received: by mail-qt1-x82a.google.com with SMTP id n7so12281944qtb.6
 for <qemu-devel@nongnu.org>; Sat, 05 Oct 2019 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=aioYTNXmk1DYvU6cSo3aKkbS/GZhc5ATgvlFHQSNSy0=;
 b=M1lNZsjp/BlfzBgB4dk0hNMlPr6wU3mMtPkCo/+Te/rnhXsG6iKYS0hUSeO5FXcFSV
 m6RFH+YPbu9iVw4ldULnurGgCEd2AHrVeVtRFEPA3tB2I9Du/aibgtGtoT+rEqk9ioDp
 Dd7fMoL+EXbhzuxb5rhTJNvudIxRoCoOprRagWF/Ke1WhffkHhcGYx3/ZsY7PJ8O2qfu
 xHxwzsmopW130kqD+M7ovzGZoZYXgJ/PWtN/0SKxLmnwGXTLIlITnGFct/sUvW3pVKnI
 XDzjZPP6Gi7NuYozNYcJozBgYK4ti5jpzq3vUNplRjeEHIs1VEKD78Ijt6YklMnSZFHH
 yM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=aioYTNXmk1DYvU6cSo3aKkbS/GZhc5ATgvlFHQSNSy0=;
 b=WJbCV9jcY0OdYoHq88yKw3WIQurxLfwzYqCFnxsGGlKjxGPTPt2pNl1Toz+BvDvpkh
 L8ffGmaltzOol2PwAKTkaotuqS3vvm6uC9fKWw23jpNyJPXueT+YsWR/Es6VgHZJa6Kd
 wmFbbnY8N54VnS4ZZXgZW1/5sh1NoWS9WG61yGaKuGbrZEynWr8xOtih7P9cwTQHpng7
 vtE9QlpOcivxfJqEnGau3SHhSRxklTFaaIJKpm/1/73CmtdMaSCAUrX7hmFQUj6UN7XY
 V62vpPli55C/OLqKzGFpk1f0BTNYtkXg5GNY6BSAq1SEd9yJzs6fifVQt0VDU0p02jo2
 2CjA==
X-Gm-Message-State: APjAAAXypg3ydfw/+NG94XOlnvahD9qStr+6zuTv3yjjdGPDhEHVv8KE
 Aa9FbaEXSBv/81W7eLoOVirzpcvtbFwZ+qxqgWkASQ==
X-Google-Smtp-Source: APXvYqw/T14SsqkbIBuULm3Cj0A5FxcuoFUbvDTMHSoe3s4a0vcPktXrSZPGLCpZpiuOOvSc3Agzij090AxN5kveU8c=
X-Received: by 2002:ac8:7310:: with SMTP id x16mr19837316qto.210.1570270859481; 
 Sat, 05 Oct 2019 03:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALvKS=E-t1c+BVDn=0RbM8nBry8GcYOXh-PrziQO7XhS7W2NUw@mail.gmail.com>
In-Reply-To: <CALvKS=E-t1c+BVDn=0RbM8nBry8GcYOXh-PrziQO7XhS7W2NUw@mail.gmail.com>
From: Lucien Murray-Pitts <lucienmp.qemu@gmail.com>
Date: Sat, 5 Oct 2019 19:20:41 +0900
Message-ID: <CALvKS=GB1-zDnkKxei6Dn5MNyr5kwj+vEtD_3MZyVNfzqQuRZg@mail.gmail.com>
Subject: RFC: Why dont we move to newer capstone?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::82a
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

Hi folks,

Whilst working on a m68k patch I noticed that the capstone in use
today (3.0) doesnt support the M68K and thus a hand turned disasm
function is used.

The newer capstone (5.0) appears to support a few more CPU, inc. m68k.

Why we move to this newer capstone?

Furthermore, if making a move why not move to something with wider cpu
support like libopcodes  ?

Cheers,
Luc

