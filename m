Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D0230658E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 22:00:56 +0100 (CET)
Received: from localhost ([::1]:57508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4rvr-0005gQ-Ib
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 16:00:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4rss-0004rp-KX
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:57:50 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:53616
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1l4rsp-000665-8E
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 15:57:50 -0500
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3C80EDA14D1;
 Wed, 27 Jan 2021 21:57:45 +0100 (CET)
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
From: Stefan Weil <sw@weilnetz.de>
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com>
 <b1d250e4-3336-fb44-8f65-baa6e7a3b7df@weilnetz.de>
Message-ID: <229d1052-2f4c-4e20-13f2-7fa4c7dddacb@weilnetz.de>
Date: Wed, 27 Jan 2021 21:57:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b1d250e4-3336-fb44-8f65-baa6e7a3b7df@weilnetz.de>
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

Am 27.01.21 um 20:42 schrieb Stefan Weil:

> Am 27.01.21 um 19:59 schrieb Daniel P. Berrangé:
>
>> On Wed, Jan 27, 2021 at 07:56:16PM +0100, Stefan Weil wrote:
>>> It returns ASN1_MEM_ERROR, so the input vector is too small.
>> Hmm, that's odd - "Value is not valid" corresponds to
>> ASN1_VALUE_NOT_VALID error code.
>
>
> I now have built libtasn1 with debug information and -O0 and can 
> confirm that asn1_der_coding returns ASN1_MEM_ERROR.
>
> That's not surprising because it is called with *len == 0, while it 
> requires at least 398.


My previous report was incomplete.

It's a normal pattern that asn1_der_coding is first called with vector 
length 0, then returns ASN1_MEM_ERROR and the required length which is 
used to allocate memory for the following call, so that was a false track.

The debug libtasn1 gives a different output:

% LANG=C tests/test-crypto-tlscredsx509
# random seed: R02S478dda7333f4b9f0f84d8d2a7da7eb08
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: Disabling X.509 extensions.
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
2: signing structure using RSA-SHA256
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_export]:2961
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_export]:2961
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_export]:2961
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_export]:2961
1..39
# Start of qcrypto tests
# Start of tlscredsx509 tests
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 1 /qcrypto/tlscredsx509/perfectserver
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 2 /qcrypto/tlscredsx509/perfectclient
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 3 /qcrypto/tlscredsx509/goodca1
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 4 /qcrypto/tlscredsx509/goodca2
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 5 /qcrypto/tlscredsx509/goodca3
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: verify.c[verify_crt]:758
3: ASSERT: verify.c[verify_crt]:824
3: ASSERT: verify.c[verify_crt]:831
3: ASSERT: verify.c[_gnutls_verify_crt_status]:1023
ok 6 /qcrypto/tlscredsx509/badca1
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
ok 7 /qcrypto/tlscredsx509/badca2
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
ok 8 /qcrypto/tlscredsx509/badca3
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 9 /qcrypto/tlscredsx509/goodserver1
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 10 /qcrypto/tlscredsx509/goodserver2
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 11 /qcrypto/tlscredsx509/goodserver3
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 12 /qcrypto/tlscredsx509/goodserver4
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 13 /qcrypto/tlscredsx509/goodserver5
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 14 /qcrypto/tlscredsx509/goodserver6
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 15 /qcrypto/tlscredsx509/goodserver7
ok 16 /qcrypto/tlscredsx509/badserver1
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
ok 17 /qcrypto/tlscredsx509/badserver2
ok 18 /qcrypto/tlscredsx509/badserver3
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 19 /qcrypto/tlscredsx509/goodclient1
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 20 /qcrypto/tlscredsx509/goodclient2
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 21 /qcrypto/tlscredsx509/goodclient3
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 22 /qcrypto/tlscredsx509/goodclient4
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 23 /qcrypto/tlscredsx509/goodclient5
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 24 /qcrypto/tlscredsx509/goodclient6
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
ok 25 /qcrypto/tlscredsx509/goodclient7
ok 26 /qcrypto/tlscredsx509/badclient1
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
ok 27 /qcrypto/tlscredsx509/badclient2
ok 28 /qcrypto/tlscredsx509/badclient3
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
ok 29 /qcrypto/tlscredsx509/expired1
ok 30 /qcrypto/tlscredsx509/expired2
ok 31 /qcrypto/tlscredsx509/expired3
3: ASSERT: common.c[_gnutls_copy_string]:1571
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3465
3: ASSERT: x509_ext.c[gnutls_x509_key_purpose_get]:3040
3: ASSERT: x509.c[gnutls_x509_crt_get_key_purpose_oid]:3459
3: ASSERT: x509.c[gnutls_x509_crt_get_authority_key_id]:1524
3: ASSERT: name_constraints.c[gnutls_x509_crt_get_name_constraints]:469
3: ASSERT: x509_ext.c[gnutls_subject_alt_names_get]:110
3: ASSERT: x509.c[get_alt_name]:1854
3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
**
ERROR:../../../tests/test-crypto-tlscredsx509.c:119:test_tls_creds: 
assertion failed: (creds == NULL)
Bail out! 
ERROR:../../../tests/test-crypto-tlscredsx509.c:119:test_tls_creds: 
assertion failed: (creds == NULL)
zsh: abort      LANG=C tests/test-crypto-tlscredsx509



