Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E47D5D88A9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 08:32:36 +0200 (CEST)
Received: from localhost ([::1]:37488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKcrL-00014c-Fa
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 02:32:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fam@euphon.net>) id 1iKcq6-0000SW-PI
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 02:31:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fam@euphon.net>) id 1iKcq5-0007m9-T9
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 02:31:18 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17773)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fam@euphon.net>)
 id 1iKcq0-0007eY-Ps; Wed, 16 Oct 2019 02:31:14 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1571207396; cv=none; d=zoho.com.cn; s=zohoarc; 
 b=XROaoXGJFCd2zIjpt1kicF11oR1X7ecGjwVvi8CXc2Y5a9CjAcn6iVkVO4x/f7ZrjpBU7NnrkM+VnbcF7ncAPTnBu66elnT5SQXLE/4enq5cvT6g3jT+dUczF407ZsCWIGxufWwKkTH68iK7JyGoV1whlwGEZi48O2SWYWt9lDc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com.cn;
 s=zohoarc; t=1571207396;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results;
 bh=hpi9ghi8l8MBJXr4jbl3jkIHmSYXRQYlnQI1o3IZxYY=; 
 b=B6Wt9tN9rZ4cV/0IO/jgCqHDWKVl734wq2IHHTIk9UUEIXT2jKeIDsZ7eUxXaNaPjK52DHNjLqIR3MG1OkxJRr3ud+HsFjtSeM34CE6x0dBCC+df2XSP1belXHvJYlvw8TDY/gxO7BwAUcayXe9UXunpJDi1QvLIAzZc9s75KRk=
ARC-Authentication-Results: i=1; mx.zoho.com.cn;
 dkim=pass  header.i=euphon.net;
 spf=pass  smtp.mailfrom=fam@euphon.net;
 dmarc=pass header.from=<fam@euphon.net> header.from=<fam@euphon.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1571207396; 
 s=zoho; d=euphon.net; i=fam@euphon.net;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 l=394; bh=hpi9ghi8l8MBJXr4jbl3jkIHmSYXRQYlnQI1o3IZxYY=;
 b=OcQ2clXHJEynGYR5n7MAjClyxrkQ7QuPDAbrbfSa0QJEPMxyZiIcYsGjFY4pN8Th
 yToLGzCfVT5z0i5npNhkW0WS6qpAEyYOgt60yrSast21v8eTgnL7BRc31eR0ob1NFRd
 kl4S1iC3XDD13UrTwimNoSEoZxKbtH8GwZcJ46l0=
Received: from localhost (120.52.147.46 [120.52.147.46]) by mx.zoho.com.cn
 with SMTPS id 1571207393763282.4907693208505;
 Wed, 16 Oct 2019 14:29:53 +0800 (CST)
Date: Wed, 16 Oct 2019 14:29:52 +0800
From: Fam Zheng <fam@euphon.net>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 00/20] nvme: support NVMe v1.3d, SGLs and multiple
 namespaces
Message-ID: <20191016062952.GA77999@magic>
References: <20191015103900.313928-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015103900.313928-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 124.251.121.243
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
Cc: Kevin Wolf <kwolf@redhat.com>, Javier Gonzalez <javier@javigon.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <keith.busch@intel.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 10/15 12:38, Klaus Jensen wrote:
> Hi,
> 
> (Quick note to Fam): most of this series is irrelevant to you as the
> maintainer of the nvme block driver, but patch "nvme: add support for
> scatter gather lists" touches block/nvme.c due to changes in the shared
> NvmeCmd struct.

Yeah, that part looks sane to me. For the block/nvme.c bit:

Acked-by: Fam Zheng <fam@euphon.net>


