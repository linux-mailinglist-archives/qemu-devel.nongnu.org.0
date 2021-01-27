Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2E5306139
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 17:46:52 +0100 (CET)
Received: from localhost ([::1]:59632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4nxz-0000Ds-Df
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 11:46:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4nwN-00086S-HR
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:45:12 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:47676
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4nwK-0002Tf-Kv
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 11:45:11 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 03DC7DA0112;
 Wed, 27 Jan 2021 17:45:00 +0100 (CET)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
Date: Wed, 27 Jan 2021 17:44:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127121723.GI3653144@redhat.com>
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
Cc: Alexander Graf <agraf@csgraf.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.01.21 um 13:17 schrieb Daniel P. Berrang=C3=A9:

> On Tue, Jan 26, 2021 at 04:41:13PM +0000, Peter Maydell wrote:
>> On Tue, 26 Jan 2021 at 16:37, Daniel P. Berrang=C3=A9 <berrange@redhat=
=2Ecom> wrote:
>>> On Tue, Jan 26, 2021 at 04:32:08PM +0000, Peter Maydell wrote:
>>>> ** (tests/test-crypto-tlscredsx509:35180): CRITICAL **: 16:23:34.590=
:
>>>> Failed to sign certificate ASN1 parser: Value is not valid.
>>>> ERROR test-crypto-tlscredsx509 - Bail out! FATAL-CRITICAL: Failed to=

>>>> sign certificate ASN1 parser: Value is not valid.
>>>> make: *** [run-test-70] Error 1
>>>>
>>>>
>>>> Does this failure ring any bells for anybody?
>>> Not seen it before.
>>>
>>> Is this using a gnutls from homebrew, or one that apple
>>> ship themselves ?  Any idea what version it is ?
>> Homebrew gnutls, 3.6.15.
> On further investigation it seems the error comes from libtasn1,
> but unfortunately there are 100's of scenarios it could arise
> so difficult one to debug.
>
> In the test_tls_generate_cert method in QEMU tests/crypto-tls-x509-help=
ers.c
>
> There are conditional lines like
>
>      if (req->country) {
>
>      if (req->altname1) {
>      ...etc...
>
> I guess one, or more of those, is writing data that libtasn1 is not hap=
py
> with.
>
> Some one with easy access to this apple silicon will likely need to sta=
rt
> by incrementally disabling each of those conditionals eg.  if (req->cou=
ntry
> && 0)
>
> until we find out which one (might be more than one) make the
>
>     Failed to sign certificate ASN1 parser: Value is not valid.
>
> error message go away. NB, once that ASN1 error goes away, the QEMU tes=
t
> suite will likely give its own error because the certs will no longer
> have the data it is expecting.
>
> Regards,
> Daniel


I could debug into gnutls_x509_crt_sign2. gnutls_x509_crt_privkey_sign=20
seems to fail.

Disabling the conditionals mentioned above did not help.

And I also have another problem when running "make check-tcg":

% make check-tcg
 =C2=A0 BUILD=C2=A0=C2=A0 TCG tests for aarch64-softmmu
 =C2=A0 BUILD=C2=A0=C2=A0 aarch64-softmmu guest-tests with cc
/qemu/tests/tcg/aarch64/system/boot.S:81:18: error: unexpected token in=20
'.section' directive
 =C2=A0.section .rodata
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^



