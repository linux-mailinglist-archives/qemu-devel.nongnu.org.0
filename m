Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E44E2D7FDB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 21:20:39 +0100 (CET)
Received: from localhost ([::1]:48656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knou6-0004yP-6V
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 15:20:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knolL-0002s9-Gd
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:11:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knolG-0002fO-Lj
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 15:11:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607717490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mdUEd5LXHeWfYapDDVIeEiWas/cE1wwbAHHmrLJFBdw=;
 b=RdCDzPOLxQ6LxjH6gsOUeYzPA3ceWdpMpSTnSHaTAVjkocbT5AemWjNcSsITN7Hv3N5HWb
 64aaoScq4PSNZUOU7+/JzzB9GMtXluB3OwO2dZA9wfRDek2oyNWck/Bso9xsRpP6QD3LCT
 1VjMTBKtCGHmtbDUG+c/YT2U65JejdE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-3C6gZF0IO32OBrWN_dnmBQ-1; Fri, 11 Dec 2020 15:11:28 -0500
X-MC-Unique: 3C6gZF0IO32OBrWN_dnmBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63F9801817;
 Fri, 11 Dec 2020 20:11:26 +0000 (UTC)
Received: from work-vm (ovpn-113-63.ams2.redhat.com [10.36.113.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AEB10023B5;
 Fri, 11 Dec 2020 20:11:14 +0000 (UTC)
Date: Fri, 11 Dec 2020 20:11:11 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH v3 06/13] virtiofsd: replace _Static_assert with
 QEMU_BUILD_BUG_ON
Message-ID: <20201211201111.GI3380@work-vm>
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
 <20201210134752.780923-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-7-marcandre.lureau@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* marcandre.lureau@redhat.com (marcandre.lureau@redhat.com) wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This allows to get rid of a check for older GCC version (which was a bit
> bogus too since it was falling back on c++ version..)
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Yes I think that's OK; this is an imported file, but we've already
mangled it into QEMU's style and added includes etc.


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  tools/virtiofsd/fuse_common.h | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/tools/virtiofsd/fuse_common.h b/tools/virtiofsd/fuse_common.h
> index 5aee5193eb..a2484060b6 100644
> --- a/tools/virtiofsd/fuse_common.h
> +++ b/tools/virtiofsd/fuse_common.h
> @@ -809,15 +809,6 @@ void fuse_remove_signal_handlers(struct fuse_session *se);
>   *
>   * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
>   */
> -
> -#if defined(__GNUC__) &&                                      \
> -    (__GNUC__ > 4 || __GNUC__ == 4 && __GNUC_MINOR__ >= 6) && \
> -    !defined __cplusplus
> -_Static_assert(sizeof(off_t) == 8, "fuse: off_t must be 64bit");
> -#else
> -struct _fuse_off_t_must_be_64bit_dummy_struct {
> -    unsigned _fuse_off_t_must_be_64bit:((sizeof(off_t) == 8) ? 1 : -1);
> -};
> -#endif
> +QEMU_BUILD_BUG_ON(sizeof(off_t) != 8);
>  
>  #endif /* FUSE_COMMON_H_ */
> -- 
> 2.29.0
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


