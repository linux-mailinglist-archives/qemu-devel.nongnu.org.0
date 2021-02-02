Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4909230BDA5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:06:14 +0100 (CET)
Received: from localhost ([::1]:59938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6uRg-0005ou-SY
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:06:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=tuFp=HE=linuxfoundation.org=gregkh@kernel.org>)
 id 1l6uQ4-0004xN-I0
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:04:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:54482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=tuFp=HE=linuxfoundation.org=gregkh@kernel.org>)
 id 1l6uQ2-0006L7-Kp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 07:04:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12CDA64F53;
 Tue,  2 Feb 2021 12:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612267466;
 bh=vpa76DJVw3u2hImBgcGY2RefNVrkqI+c8q81hUCChG8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IgUfc5NoKYN48z3xn3H9Z2AYFDRkw6a/uH5nFMZS5cIBCXMCVRf6GQGuNGkyMaH4G
 Fcfl8CYT2GXLLKm/8Tgov0ejWOyQPSvbiZq2uL6aaBcU1Eh2lOQOPnow+TsTFU4tuA
 tDZoAwHYvXTfc2sFlK2NPw4+AgpSPcWPEQtblr24=
Date: Tue, 2 Feb 2021 13:04:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <YBk/xskdrwqTOyM9@kroah.com>
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612200294-17561-2-git-send-email-acatan@amazon.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=SRS0=tuFp=HE=linuxfoundation.org=gregkh@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au, mst@redhat.com,
 ebiggers@kernel.org, borntraeger@de.ibm.com, sblbir@amazon.com,
 bonzini@gnu.org, arnd@arndb.de, jannh@google.com, raduweis@amazon.com,
 asmehra@redhat.com, graf@amazon.com, rppt@kernel.org, luto@kernel.org,
 gil@azul.com, oridgar@gmail.com, colmmacc@amazon.com, tytso@mit.edu,
 ovzxemul@gmail.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, rafael@kernel.org, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 07:24:53PM +0200, Adrian Catangiu wrote:
> +config SYSGENID
> +	tristate "System Generation ID driver"
> +	default N

"N" is always the default, no need to list it again :(


