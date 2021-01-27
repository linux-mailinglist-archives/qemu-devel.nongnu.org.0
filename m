Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB09306196
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 18:08:35 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4oJ0-0002ro-JM
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 12:08:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4oG7-0001qE-Ee
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:05:35 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:47800
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4oFk-0004uY-3i
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 12:05:23 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 252FDDA159E;
 Wed, 27 Jan 2021 18:05:09 +0100 (CET)
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
Date: Wed, 27 Jan 2021 18:05:08 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210127165330.GT3653144@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 27.01.21 um 17:53 schrieb Daniel P. Berrangé:

> In $QEMU.git/crypto/init.c can you uncomment the "#define DEBUG_GNUTLS"
> line and then re-build and re-run the test case.
>
> There's a bunch of debug logs in code paths from gnutls_x509_crt_privkey_sign
> that might give us useful info.
>
> Regards,
> Daniel


% LANG=C.UTF-8 tests/test-crypto-tlscredsx509
# random seed: R02S9b95072a368ad370cdd4c780b8074596
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: common.c[_gnutls_x509_der_encode]:855
3: ASSERT: sign.c[_gnutls_x509_pkix_sign]:174
3: ASSERT: x509_write.c[gnutls_x509_crt_privkey_sign]:1834
3: ASSERT: x509_write.c[gnutls_x509_crt_sign2]:1152
Bail out! FATAL-CRITICAL: Failed to sign certificate ASN1 parser: Value 
is not valid.


