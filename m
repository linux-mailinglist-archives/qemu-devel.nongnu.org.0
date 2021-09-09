Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9F405BBD
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 19:06:37 +0200 (CEST)
Received: from localhost ([::1]:33302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mONVU-0006Kt-84
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 13:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mONTF-0004xi-G9
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 13:04:18 -0400
Received: from mail.xenproject.org ([104.130.215.37]:42344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iwj@xenproject.org>)
 id 1mONTD-0006Ni-FV
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 13:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
 :Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
 bh=Br91uh8E0NvBoHS022PXFOhYm0jRF4W2cYdOJwl1NQU=; b=jbOb8A7xr8S35Dw4U/rygCcwTi
 OgKsRgZ0J8r78l+jmtkJ9NoZYXdySnm7xBg4wVe6TlyDi9BDswplss1HE2ZFjvTLGDjnV8MqkTbye
 tPTwie2MMJXMECmhIbI1WrCmI7AZs7LxM0zNVSBL+97rNWh4CuMo/v8KoE0o2JNGinMM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mONTC-0002gh-QW
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:04:14 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mONTC-00078N-P1
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 17:04:14 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mONT6-0006yy-EK; Thu, 09 Sep 2021 18:04:08 +0100
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24890.16008.223866.916605@mariner.uk.xensource.com>
Date: Thu, 9 Sep 2021 18:04:08 +0100
To: Daniel P. =?iso-8859-1?Q?Berrang=E9?= <berrange@redhat.com>
Subject: Re: [RFC v3 13/32] rust: use vendored-sources
In-Reply-To: <YTo8GPGphaD4Xx3b@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-14-marcandre.lureau@redhat.com>
 <CAFEAcA-=P+p7etUiLUzDxDzfe8N6TQyLC5=ExTSzgG4iOh0-dQ@mail.gmail.com>
 <CAJ+F1C+xL5_2c+7pSequokT-0yJ=pUT2V81iX_A_WLyVsWywEQ@mail.gmail.com>
 <YTo8GPGphaD4Xx3b@redhat.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Received-SPF: pass client-ip=104.130.215.37; envelope-from=iwj@xenproject.org;
 helo=mail.xenproject.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.975,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrangé writes ("Re: [RFC v3 13/32] rust: use vendored-sources"):
> On Thu, Sep 09, 2021 at 08:29:58PM +0400, Marc-André Lureau wrote:
> > True, at least on Fedora, there is machinery to package "regular" Rust
> > programs/crates in an automated way.  Vendoring dependencies should work
> > equally, but may not conform with distro policies, so they have extra work
> > eventually (it seems vendoring is more and more common though, with go
> > projects for example)
> 
> I wouldn't assume that we're going to be able to use that RPM support
> for rust, if we bundle our rust code inside the QEMU tarball and hidden
> behind meson. It generally only works well in single language projects
> using the preferred build tool exclusively (Cargo in this case).

I can't speak to RPM, but Debian's arrangements for avoiding crates.io
downloads at packag-ebuild-time will work just fine even if it
the cargo calls are buried inside meson.  All that would be needed is
a way to disable any source replacement done by qemu (see previous
mail) so that Debian's source replacement takes effect.

Ian.

