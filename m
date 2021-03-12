Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AEE3397BC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 20:48:48 +0100 (CET)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKnmB-00015x-Nr
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 14:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jklimek@gmail.com>) id 1lKnB0-0006kI-3z
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:10:22 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jklimek@gmail.com>) id 1lKnAx-0003xy-Ci
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 14:10:21 -0500
Received: by mail-ed1-x530.google.com with SMTP id bf3so9453760edb.6
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 11:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=u+Go35QeoXUNC9imz+XX32Z0wemUmRDWTNyvWbnm8RE=;
 b=VjfiwqQTu4z6EwP25/8pYeMbOmfLkouoSvrxMlwMtFsz6yL9LXZ1PvHSJXVR6y1yzv
 ASwSvw6fcc3CurOUYIaTwnNBovum0NTh5/O0rn9/CEd8BG7uDTp6BL1OWqHkzhjXSZmW
 Qg7vGbRmzgyS+1Qh0lk1LUMeW827dyrHGw+qzfGvmthtxr56o9rZ3h76h9nXEmJpJDjG
 0xAJVuIk+ezzU4Q7jryUwxYRPWywdNRUs0XSDTHGECEXYDGkZht/6g5JHOvTaK+F8+z6
 mPCvaP044FkQTa+RDNNDw66O6CrMTwmp971GGJUSyyWdfRJs8M9at3LQCdQsHDwDjb7i
 x9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=u+Go35QeoXUNC9imz+XX32Z0wemUmRDWTNyvWbnm8RE=;
 b=jF7x9xbT0OjTzgvDCbdEp6uXwgcWqxjAARFnb+agCRNSsN614IJYXaGTEr3wiDVi6c
 wTku/WKe9MuZywQ8hZDfW/a1z5bqlsetiPPps3wLl6A+4nWPRlS2ohvkGn+9DhU9hMAm
 4vedb0+n3kJ4I3XWxJyZXL3SS/EzD9I29dzOHXChHAh33CwBUo2gVlc0y7+7WUHnsClS
 COHfbDmcFnyS0A0BvnNUdSvFo5fUhv1tGtgDwk3dRkvX7OFVEQoe2Huxbi1p4XAs2ya7
 AQXnqDO9sIG2CKGOIIrd+7htxjA5XDrKyO7KhDCXxx0gzUxyWtiY83UNkW+p7brE1/xf
 lkDg==
X-Gm-Message-State: AOAM533hYkC568Nt8iaFrQLjigFP97pKch8mE7wNPbSx5HDorkMpbe8h
 W9i6qAvrQiZg0nQginaQR3Mo7ORH9pRfHXo4jwQ=
X-Google-Smtp-Source: ABdhPJwr+yjXQw5zIP+kWJGB48CU1rA7RPhb2TOXzfwaTuuwsCIYFdbfXqxAOvCIp0hP6iQ+ii6fbCvAVMuSI1pVUxQ=
X-Received: by 2002:a50:cc4a:: with SMTP id n10mr16269540edi.371.1615576216820; 
 Fri, 12 Mar 2021 11:10:16 -0800 (PST)
MIME-Version: 1.0
References: <CAOEv1kaN60EjpbxjMq6=K2FFLiW3DbufiTg0evcA72h-2qyW_g@mail.gmail.com>
 <CAJ+F1CJH9807P1fJ1rKR3Kvg2P8-SN3s8sCxkQ9w+Py2uvev=w@mail.gmail.com>
In-Reply-To: <CAJ+F1CJH9807P1fJ1rKR3Kvg2P8-SN3s8sCxkQ9w+Py2uvev=w@mail.gmail.com>
From: John Klimek <jklimek@gmail.com>
Date: Fri, 12 Mar 2021 14:10:07 -0500
Message-ID: <CAOEv1kYzRWDzpzgMt0bGDEVKrEjDYXTJNqYdsXj+8f2L6uYieA@mail.gmail.com>
Subject: Re: 3D Acceleration for Windows hosts?
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jklimek@gmail.com; helo=mail-ed1-x530.google.com
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks very much for the information.

However, when I try to run configure with --enable-opengl it reports
the following:

ERROR: User requested feature opengl
       configure was not able to find it.
       Please install opengl (mesa) devel pkgs: epoxy gbm

It looks like it requires gbm which is only available for Linux
DRM/KRS.  I don't see any configuration options to enable OpenGL with
SDL and GTK3?

On Fri, Mar 12, 2021 at 2:01 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Fri, Mar 12, 2021 at 2:44 AM John Klimek <jklimek@gmail.com> wrote:
>>
>> Does QEMU have any support for 3D acceleration on Windows hosts?
>>
>> I'm not too familiar with video/graphics libraries, but it seems like
>> QEMU OpenGL support requires Mesa GBM which is only available for
>> Linux (DRM/KMS).
>
>
> In theory, the SDL and GTK3 backends should work on Windows with gl=3Don.=
 But I don't think anyone really tried it, so a few fixes are to be expecte=
d.
>
>>
>> The other option is the Virgl3D renderer but that also requires Linux (D=
RM).
>>
>
> Not so long ago, it was possible to cross-compile virgl for windows. But =
virgl depends on a functioning QEMU GL backend, so getting the above is a p=
reliminary. Note that OpenGL drivers on Windows have been notoriously bad, =
and you may need to use ANGLE.
>
>>
>> I'm not really sure if I know what I'm talking about so please correct
>> me if I'm wrong and also let me know if there is a way to enable 3D
>> acceleration under Windows hosts.
>
>
> --
> Marc-Andr=C3=A9 Lureau

