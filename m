Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC524B851C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 11:04:03 +0100 (CET)
Received: from localhost ([::1]:44194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKHAI-00038W-G0
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 05:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKGnp-00059t-6E
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:40:49 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:39403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nKGnn-00041o-Ab
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 04:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=DnoLxQnRBvdsPPnmyKIZ7rrB48mBA5GIkMXPLS8rWhU=; b=YJb2wIJ4dRVmADtJvLbBvF1V+l
 NS6UKI3qbpkujYPBJYCTmAjMyqXXWWK30Yfg/8i3lO35rm7k06qfl7BegThXHYgHvyUtDh0RPOXRQ
 vaZbDDhPI86Ax0BgQVeDXmM4BTJ9L+D8FNZxiG8/1PqthCWgMj2lexXpO6h95e5sVE/FAYIQ0Fk8W
 QVFDpWXFSmBIlY/OrplN6ql/RP5dRyem9Bs3RXsxvR1NAO3srLepREYj7bP9hGEg0C/t8+2LfNbY8
 J1TZY6gdsWP1spoNhBWtH9hBBYAgE2AWlt2yut7+PQnta1Iq8iW/Dm4/4ERnFCeR/xaJavS7IaXeg
 +GwmJ3SkM6HjZYtLyYkO1dq6i0QcvnSR0P6HE2WuC1bg9qbS2rD4BuYrAoVhnuhWgmRwFTwDyazgS
 u7podaiDowxaljEj5wSf+oxF2103qms81iHdNhsynkDq0ED4cHTDmSvBimBLZtd7boV5KvG6Oe7PP
 0Q599OCE2b9fxoWB+CfJ7ItR/zBywa0P0dNbgH9iM2mYpp1iUlTaCFAmstGLFUPCmp4wv62cbtYF5
 +OaC8nSrvMbIDrClRUkOEDMqGBmFuaeyJwIRlfb+07aeoiZ0kKW1lrYw+LIsBWmWnOU/+qG2ExDY6
 eHEgP9sNEk18UEYfXZfgfb6pqeWCItTFndAc7oo44=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 00/11] 9p: Add support for darwin
Date: Wed, 16 Feb 2022 10:40:43 +0100
Message-ID: <1675203.7fs20g0DcF@silver>
In-Reply-To: <CAB26zV2V7bMUSnzhp7Px04duNu2m+D20t0wpTM+wXgzaZrk-4w@mail.gmail.com>
References: <20220210132946.2303-1-wwcohen@gmail.com>
 <CAB26zV2V7bMUSnzhp7Px04duNu2m+D20t0wpTM+wXgzaZrk-4w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Montag, 14. Februar 2022 21:33:37 CET Will Cohen wrote:
> Hello all,
> 
> I'm seeing on the updated release schedule that we're now looking at March
> 8 for soft feature freeze (
> https://wiki.qemu.org/Planning/7.0#Release_Schedule). Is there anything
> additional that should be prepared for this patch set to hopefully be able
> to target 7.0?
> 
> Will

That's in three weeks. I'm optimistic that we get this merged before the QEMU 
7.0 soft freeze deadline.

Best regards,
Christian Schoenebeck



