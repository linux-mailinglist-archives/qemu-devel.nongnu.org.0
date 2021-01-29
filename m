Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A044630890C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:26:03 +0100 (CET)
Received: from localhost ([::1]:40098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Sqg-00010w-JZ
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l5Sjh-0002QT-5P
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:18:49 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:39044
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l5Sjd-0005vV-Ib
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 07:18:48 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 73B78DA15C3;
 Fri, 29 Jan 2021 13:18:43 +0100 (CET)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210128171523.45921-1-sw@weilnetz.de>
 <20210129100624.GE4001740@redhat.com>
 <f8e03cad-4eb8-92c0-eed5-a3ab033e2ab4@weilnetz.de>
 <20210129114745.GI4001740@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] tests: Replace deprecated ASN1 code
Message-ID: <ce85d1ef-9c3a-d77a-d72d-84f025c6ce78@weilnetz.de>
Date: Fri, 29 Jan 2021 13:18:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210129114745.GI4001740@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 29.01.21 um 12:47 schrieb Daniel P. Berrang=C3=A9:

> This is really odd.
> I've got the 4.16.0 tar.gz for libtasn1 and it does not contain any
> such _Pragma / deprecation warnings.
>
> The libtasn1  git repo *does* contain these pragmas, but only in the
> dev tree for the unreleased 4.17.0 version.
>
> The homebrew-core.git repo recipe for libtasn1 claims to be using
> 4.16.0 release
>
>    https://github.com/Homebrew/homebrew-core/blob/master/Formula/libtas=
n1.rb
>
> and those tarballs match what i have.
>
> None the less it looks like your 4.16.0 installed version is in fact
> a  git snapshot. Damned if I understand what homebrew is doing.
>
> None the less, given that these deprecations are in libtasn1 git upstre=
am,
> we're going to have to deal with them.
>
>
> Regards,
> Daniel


Mea culpa.

While examining the problem with some tests on new Macs which were=20
reported by Peter, I used a local build of libtasn1 with debug=20
information. I also tried git master to see whether the problem was=20
fixed there, so my current header files were indeed newer than the=20
official 4.16.0 ones. That explains why I was the first one to see those =

error messages.

Stefan




