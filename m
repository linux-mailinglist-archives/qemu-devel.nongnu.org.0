Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D19C53CD11
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 18:22:09 +0200 (CEST)
Received: from localhost ([::1]:46844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxA3s-0007fW-AJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 12:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nx9qk-0002NT-AW
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:08:35 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nx9qi-0000vQ-Js
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 12:08:33 -0400
Received: by mail-ed1-x52e.google.com with SMTP id x5so5684394edi.2
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xcuKNM0y7lwXGLo1qZZAXEzxxAZaSKuIKvrywcX5QLg=;
 b=oxSIm51tnDp+p2Z9uIseBolukajXG26ch+SGYcFt17bWO3SzwXnIS3POiCZ1fyLoaL
 TmXiX7ihG59ZkQpyU2U1fzDPC7LYNdyT78pWE3yOwbJizWjoa0fwmmHpJi9eHwln1j9M
 HLAtvlWqaQ48hev+ckpDGLXtV9y1rO3JVnVmZWgVfsb52Z3z8g+SbYmUT/9PyOWC+XJx
 Rpx0/azcZnGO8+LfpwTqRYLy5N5Py21OtkqZFNVUig1NmzNjNX40sduZMVAMTB/vSgnG
 GiLjuVxFzQnAfl51+NxshVrL9VazyILUMylgpH4pQMJTCZQDG+R/t6p/mhlc3M8IJZky
 cj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xcuKNM0y7lwXGLo1qZZAXEzxxAZaSKuIKvrywcX5QLg=;
 b=MKgJr+pdHpybUUAf2MufOnD95bAk8c1KA1UVg1Y5znQ1l1e3TEUA2GMRbN7uVoEPJ4
 13bhHlxN2Jk1KOaf07ZkXXSqzbagJ2sB+B8xje/vFBA+6r7wOLVMhkBivi9pXW8oEvoT
 1vHxSDjHF8GOO5guY4KlW19b/XsVl9qnXcU1iIl33YfbPeUUQZ3+15LibG7Q0cPnVsc8
 l2rzxMRkxhLF5t4Pxw214MwrS8oqWJHRp3mXo9sah4lIKSHa7noWORIed1JSUa9fFlyw
 nxNmUkKg/cBws9LHwTHcy57nIwsTeJPlo3OmmiL5uy+sCJ1Y09+gsG2cWbB7EtzS9G10
 Q0AA==
X-Gm-Message-State: AOAM531OXs2oKdCn1E28llznS+JMmV+jsnU208vluW067Q0hjRYvxDEn
 8O5idizq7AyeSkWS9G7YJMcgqtpVgSLsn6upGZTUAQ==
X-Google-Smtp-Source: ABdhPJwCLmANVSgoH6KVkh105t8HU2mipzv3FNTGKn8vKYVyO8xTmVmn9QTeP+uz5cdM3yW9mAYiUSkTdZfrBuyqmNU=
X-Received: by 2002:a05:6402:1f8c:b0:42d:c3a9:5beb with SMTP id
 c12-20020a0564021f8c00b0042dc3a95bebmr11616715edc.160.1654272510978; Fri, 03
 Jun 2022 09:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwyg-n-u+ATuYWsCu35kqos1z7UwcfCAPz-6LTgbQ3q2VA@mail.gmail.com>
In-Reply-To: <CAARzgwyg-n-u+ATuYWsCu35kqos1z7UwcfCAPz-6LTgbQ3q2VA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 3 Jun 2022 21:38:19 +0530
Message-ID: <CAARzgwwJ1xeW46+RX779sBf7nWs1okwBBE3qtZXYL4ODsGVPCw@mail.gmail.com>
Subject: Re: Changes for building bits on newer gcc 9.4 compiler
To: Josh Triplett <josh@joshtriplett.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::52e;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52e.google.com
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

On an additional note, my changes are not backward compatible with
older compiler. The build will break when built with a centos 7
docker/vm/host:

/home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:
In function '_build_callargs':
/home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:3707:6:
error: empty declaration [-Werror]
      __attribute__ ((fallthrough));
      ^
/home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:3707:6:
error: ISO C90 forbids mixed declarations and code
[-Werror=declaration-after-statement]
/home/anisinha/workspace/bits/build/grub/grub-core/contrib-deps/python/Modules/_ctypes/_ctypes.c:
At top level:
cc1: error: unrecognized command line option
"-Wno-shift-negative-value" [-Werror]
cc1: error: unrecognized command line option "-Wno-cast-function-type" [-Werror]
cc1: error: unrecognized command line option
"-Wno-address-of-packed-member" [-Werror]
cc1: error: unrecognized command line option
"-Wno-discarded-array-qualifiers" [-Werror]

If fixing this is essential, we can ifdef some of these changes
between compiler version checks.

On Fri, Jun 3, 2022 at 2:06 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> Hi josh :
> Here are the pull requests. Please feel free to review and merge:
>
> Main bits module:
> https://github.com/biosbits/bits/pull/13
>
> Submodules:
> https://github.com/biosbits/grub/pull/1
> https://github.com/biosbits/python/pull/1
> https://github.com/biosbits/libffi/pull/1
> https://github.com/biosbits/fdlibm/pull/1
>
> Thanks
> ani

