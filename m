Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D92C5BC3A5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 09:48:21 +0200 (CEST)
Received: from localhost ([::1]:42264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaBVr-0003CQ-II
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 03:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leohou163@163.com>) id 1oaBPJ-0007b3-Ei
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:41:34 -0400
Received: from m13123.mail.163.com ([220.181.13.123]:51276)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leohou163@163.com>) id 1oaBP7-0002sZ-TB
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 03:41:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:MIME-Version:Message-ID; bh=it/nA
 flQPDct7OoIQuZJ9Twd9ZFTQyz6ZXZ2XF7LMP8=; b=Xeu+T5CEgXpzsljUs69qY
 tXWZJ1wbVVBFKmm+QgActgwT176Y4kxaSOrPZQ1UZBNMv2aoZCZ+M23fzcncv0fU
 uRXQra3liSkNwirpCg/2be9Mm8Ox9DNnVrmnKDgkKFoiSw06TNTKhPXFczkG6sJ1
 D9hOEnXLX9x/LWT8KGqMRU=
Received: from leohou163$163.com ( [39.155.188.22] ) by
 ajax-webmail-wmsvr123 (Coremail) ; Mon, 19 Sep 2022 15:41:15 +0800 (CST)
X-Originating-IP: [39.155.188.22]
Date: Mon, 19 Sep 2022 15:41:15 +0800 (CST)
From: leohou  <leohou163@163.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: suport sr-iov to virtio-net
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20220113(9671e152)
 Copyright (c) 2002-2022 www.mailtech.cn 163com
Content-Type: multipart/alternative; 
 boundary="----=_Part_65213_551570076.1663573275846"
MIME-Version: 1.0
Message-ID: <414c10aa.4569.18354b1b4c6.Coremail.leohou163@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: e8GowAAHpX0bHShjV0NhAA--.7347W
X-CM-SenderInfo: xohrx0jxrwjqqrwthudrp/
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
Received-SPF: pass client-ip=220.181.13.123; envelope-from=leohou163@163.com;
 helo=m13123.mail.163.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

------=_Part_65213_551570076.1663573275846
Content-Type: text/plain; charset=GBK
Content-Transfer-Encoding: base64

aGkgYWxsLAogICAgICAgIEkgd2FudCB0byBzdXBwb3J0IHNyLWlvdiB0byB2aXJ0aW8tbmV0LCBI
b3cgYWJvdXQgdGhpcyBmZWF0dXJlPwoK
------=_Part_65213_551570076.1663573275846
Content-Type: text/html; charset=GBK
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPgoKICAgIAoKCjxzdHlsZT4KICAgIGZvbnR7CiAgICAgICAgbGlu
ZS1oZWlnaHQ6IDEuNjsKICAgIH0KICAgIHVsLG9sewogICAgICAgIHBhZGRpbmctbGVmdDogMjBw
eDsKICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9uOiBpbnNpZGU7CiAgICB9Cjwvc3R5bGU+Cjxk
aXYgc3R5bGU9ImZvbnQtZmFtaWx5Os6iyO3RxbraLFZlcmRhbmEsJnF1b3Q7TWljcm9zb2Z0IFlh
aGVpJnF1b3Q7LFNpbVN1bixzYW5zLXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyBsaW5lLWhlaWdodDox
LjY7Ij4KICAgIDxkaXY+PGRpdj4KICAgIDxkaXY+CiAgICAgICAgPGRpdiBzdHlsZT0iZm9udC1m
YW1pbHk6ICdNaWNyb3NvZnQgWWFIZWkgVUknLCBUYWhvbWE7IGZvbnQtdmFyaWFudC1saWdhdHVy
ZXM6IG5vcm1hbDsgb3JwaGFuczogMjsgd2lkb3dzOiAyOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2Io
MjU1LCAyNTUsIDI1NSk7Ij5oaSBhbGwsPC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6ICdN
aWNyb3NvZnQgWWFIZWkgVUknLCBUYWhvbWE7IGZvbnQtdmFyaWFudC1saWdhdHVyZXM6IG5vcm1h
bDsgb3JwaGFuczogMjsgd2lkb3dzOiAyOyBiYWNrZ3JvdW5kLWNvbG9yOiByZ2IoMjU1LCAyNTUs
IDI1NSk7Ij4mbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsgSSB3YW50
IHRvIHN1cHBvcnQgc3ItaW92IHRvIHZpcnRpby1uZXQsIEhvdyBhYm91dCB0aGlzIGZlYXR1cmU/
PC9kaXY+PHNwYW4+CiAgICAgICAgICAgIAogICAgICAgIDwvc3Bhbj4KICAgIDwvZGl2PgogICAg
PGRpdj4KICAgICAgICA8c3Bhbj4KICAgICAgICAgICAgPGJyPgogICAgICAgIDwvc3Bhbj4KICAg
IDwvZGl2PgogICAgPGRpdiBpZD0ibnRlcy1wY21hYy1zaWduYXR1cmUiIHN0eWxlPSJmb250LWZh
bWlseTonzqLI7dHFutonIj4KICAgICAgICAKICAgICAgICA8ZGl2IHN0eWxlPSJmb250LXNpemU6
MTRweDsgcGFkZGluZzogMDsgIG1hcmdpbjowOyI+CgogICAgICAgIDwvZGl2PgogICAgPC9kaXY+
CjwvZGl2PjwvZGl2Pgo8L2Rpdj4KCjwvZGl2Pg==
------=_Part_65213_551570076.1663573275846--


