Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC2036620
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 22:58:05 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49858 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYcyy-00063O-U1
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 16:58:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpa@zytor.com>) id 1hYcoF-0005j6-0l
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:46:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpa@zytor.com>) id 1hYcoC-0004Ju-SN
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:46:58 -0400
Received: from terminus.zytor.com ([198.137.202.136]:42955 helo=mail.zytor.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <hpa@zytor.com>) id 1hYcoB-0004Bc-7v
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 16:46:55 -0400
Received: from carbon-x1.hos.anvin.org ([192.55.54.60]) (authenticated bits=0)
	by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id x55Kknta1677802
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 5 Jun 2019 13:46:49 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com x55Kknta1677802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2019051801; t=1559767610;
	bh=WqBE13UslozMsjTH/RL6KZ/KWhTyuH4I2RYDIGLL+WA=;
	h=Subject:From:To:References:Date:In-Reply-To:From;
	b=UBXzIkxUpKfbWiZDmisY3f0dnYRr48OG6N+uZryxRD9XJQ9QTt9gsbqjo34BoFugo
	BkoIhCeIJcRDxnALXbjmA2/KIJyRw/IkaGngQIRgpLzQLbqSolr+4pw6VdOhQ2lxyJ
	9q6ys1JIBr+S/lb1+sgki/HqQkS7riejtVOjUAQjGuOCngc6e6/S8EQRNM6aXqajQk
	2E9XmShysfJTsQ0VEIhYLJgTHdS5rHoi5t+FQc0QqSME4uO4cNVMLMsqt1fxFH/cSy
	FUgt+6QRVRwz7/xiNkbcuLleo7y04Clhu4dKRnw1fNcCOF6tsVPXoPlEC634PJPar6
	+6fAyP69RP4wg==
From: "H. Peter Anvin" <hpa@zytor.com>
To: qemu-devel@nongnu.org
References: <6364a057-23ab-db7f-cb2c-ccff70fb7aed@zytor.com>
Message-ID: <aaf15ebe-7442-2e25-d533-c40c2e2df8cb@zytor.com>
Date: Wed, 5 Jun 2019 13:46:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <6364a057-23ab-db7f-cb2c-ccff70fb7aed@zytor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 198.137.202.136
Subject: Re: [Qemu-devel] Qemu baseline requirements/portability?
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/5/19 12:55 PM, H. Peter Anvin wrote:
> Hi,
> 
> I am writing some code I'm hoping will be able to make it into Qemu, but I
> can't seem to find what the baseline portability requirements are.  I'm
> specifically wondering about newer POSIX features like openat(), which seems
> to be used in the 9p filesystem and nowhere else, and what version of glib one
> can rely on?
> 

Specifically, I'm trying to satisfy a 10-year-old request by me and others to
support composite initrd during Linux boot.

	-hpa


