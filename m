Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9DE26DEAB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:57994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvD6-0004aY-UA
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 10:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIvBR-0002wM-VP; Thu, 17 Sep 2020 10:46:49 -0400
Resent-Date: Thu, 17 Sep 2020 10:46:49 -0400
Resent-Message-Id: <E1kIvBR-0002wM-VP@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1kIvBP-0007LD-ED; Thu, 17 Sep 2020 10:46:49 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1600353969; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=DbYGZlMDzwTf02Kt5am27UnrChrbYjJeHXPrtG5DabquV7FwtTvpri+3YWXjZwW9VbTd707jpSIwl7mKFIEUek8epVuUUPoOrnK7ezD+Gx+JxZiwIACHTSjI5FLfGJLVWfLMPtMwnlvAPRjRexEhiim8SnZMG1pJkBgi+IuiszM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1600353969;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=wpKa+E1ymNcu/wy5Xg9uB9XjbsDZo8zAUudFxKgMo4A=; 
 b=dgzXQpbAF+O4KX/WYdO6Ckk9YPmfSp4mOXBhlf2Mdd6P3TBB9TEWdBihGtEbfnGywQn9zP0RjjMuulKybPbFgwkYxkUUw7MqYFDtO0OXTaKT+C+rp42bcG5COAsoONeiHNHIls6JhaC5Okjqe062shoCzpgEQBg/s7Ba2yPAQUY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1600353966591282.5282417696268;
 Thu, 17 Sep 2020 07:46:06 -0700 (PDT)
Subject: Re: [PATCH v4 0/5] s390x/pci: Accomodate vfio DMA limiting
Message-ID: <160035396423.8478.4968781368528580151@66eaa9a8a123>
In-Reply-To: <1600352445-21110-1-git-send-email-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: mjrosato@linux.ibm.com
Date: Thu, 17 Sep 2020 07:46:06 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/17 04:07:10
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 david@redhat.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 schnelle@linux.ibm.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, alex.williamson@redhat.com, mst@redhat.com,
 pbonzini@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8xNjAwMzUyNDQ1LTIxMTEwLTEt
Z2l0LXNlbmQtZW1haWwtbWpyb3NhdG9AbGludXguaWJtLmNvbS8KCgoKSGksCgpUaGlzIHNlcmll
cyBmYWlsZWQgdGhlIGRvY2tlci1xdWlja0BjZW50b3M3IGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5k
IHRoZSB0ZXN0aW5nIGNvbW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZl
IERvY2tlciBpbnN0YWxsZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHku
CgoKCgoKClRoZSBmdWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xv
Z3MvMTYwMDM1MjQ0NS0yMTExMC0xLWdpdC1zZW5kLWVtYWlsLW1qcm9zYXRvQGxpbnV4LmlibS5j
b20vdGVzdGluZy5kb2NrZXItcXVpY2tAY2VudG9zNy8/dHlwZT1tZXNzYWdlLgotLS0KRW1haWwg
Z2VuZXJhdGVkIGF1dG9tYXRpY2FsbHkgYnkgUGF0Y2hldyBbaHR0cHM6Ly9wYXRjaGV3Lm9yZy9d
LgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXctZGV2ZWxAcmVkaGF0LmNvbQ==

