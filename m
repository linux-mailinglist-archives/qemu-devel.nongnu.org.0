Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903266928
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Jul 2019 10:30:56 +0200 (CEST)
Received: from localhost ([::1]:47530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlqxD-0002q2-Ko
	for lists+qemu-devel@lfdr.de; Fri, 12 Jul 2019 04:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hlqwz-0002Rh-Qi
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 04:30:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hlqwy-0003sI-Ub
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 04:30:41 -0400
Received: from mail-wr1-f45.google.com ([209.85.221.45]:36150)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hlqwy-0003rJ-N5
 for qemu-devel@nongnu.org; Fri, 12 Jul 2019 04:30:40 -0400
Received: by mail-wr1-f45.google.com with SMTP id n4so9043930wrs.3
 for <qemu-devel@nongnu.org>; Fri, 12 Jul 2019 01:30:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=4uTnI7sG4Uw4XGW7EC95FtjEgKOMfIK5N5sjmbHcJhE=;
 b=OxPCAhlEvx6vLCWrC6NggP6526KBj4tgB/mFXvTAI3HdDgl162sz09MyHJDwFqlAkI
 +kfHPAjmnRZ99JXVI1PbdzWYzY6nW+osuMt95LNXYg84HQ1I3AoXp/msLq0c2bztbpCt
 UVHR72IUWtrdXMcDIQQlXCin26nckNbAvyFYHq0tdYa9OYluaIBaNDAxPoFfWvbk+XTz
 iIbtEOFC9xU3YTLhWYRJwjpDs7fmGiDFKDGagw/wRZrYS+CAExGzHH5Swcx9WZCeqXSF
 pOuwyFbrwT4nGOWykXdUalwjBdibL9+iGKoFWQBg2rAEJdeIikh1GMdBVMAwxaIvLUvb
 pE5Q==
X-Gm-Message-State: APjAAAUX1dNdqAuWDn/ECNDFYKxr1YVPY6RuyguO/q/tsXs47Ux319B7
 L13B6IiyQxt7g3dgjNeT11RTxQ==
X-Google-Smtp-Source: APXvYqxXmwyRHcGJg7ciCSXJ5iLAPnNUHMLOZ6v5UkTt3Pulyz4PwgilbX0mJQojZPCMGCoqPxiBqg==
X-Received: by 2002:adf:e803:: with SMTP id o3mr10280130wrm.69.1562920239424; 
 Fri, 12 Jul 2019 01:30:39 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
 [79.13.201.122])
 by smtp.gmail.com with ESMTPSA id m24sm4598365wmi.39.2019.07.12.01.30.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 12 Jul 2019 01:30:38 -0700 (PDT)
Date: Fri, 12 Jul 2019 10:30:36 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190712083036.thxtq3zfrm3bmcvt@steredhat>
References: <20190711120609.12773-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190711120609.12773-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.45
Subject: Re: [Qemu-devel] [PATCH-for-4.1] tests/docker: Install Sphinx in
 the Ubuntu images
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 11, 2019 at 02:06:09PM +0200, Philippe Mathieu-Daud� wrote:
> Since commit 5f71eac06e the Sphinx tool is required
> to build the rST documentation.
> 
> This fixes:
> 
>  $ ./configure --enable-docs
> 
>  ERROR: User requested feature docs
>         configure was not able to find it.
>         Install texinfo, Perl/perl-podlators and python-sphinx
> 
> Signed-off-by: Philippe Mathieu-Daud� <philmd@redhat.com>
> ---
>  tests/docker/dockerfiles/ubuntu.docker     | 1 +
>  tests/docker/dockerfiles/ubuntu1804.docker | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

