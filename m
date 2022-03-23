Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9494E52F4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 14:21:49 +0100 (CET)
Received: from localhost ([::1]:58122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX0vs-0000Ac-Gf
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 09:21:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nX0in-0006Bs-VW
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:08:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nX0ik-00074Z-PZ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 09:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648040892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOqHR9rBUQgUCFqaDhUklgd77k7cLVDFhZid0F31cZY=;
 b=GrWYsMdy8/HGovdXXdO0tXNU02WzsS/mBXX/L5CIHvGrmOCg0ChntdGLYFLeswUiMWOWpk
 PIjUuisga+EmtwaZaDrG8WdfvCuE55jFDmPPtXx87ot4/rDvUFKoXx2D97tAsUbGS8J8ee
 a2kFqvx6BHAacO9JXpnmOkW+9A2AwkU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-128-NgkXpbxRNLG2NfGFmv2Ulg-1; Wed, 23 Mar 2022 09:08:10 -0400
X-MC-Unique: NgkXpbxRNLG2NfGFmv2Ulg-1
Received: by mail-yb1-f200.google.com with SMTP id
 e8-20020a259248000000b0063391b39d14so1120270ybo.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 06:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YOqHR9rBUQgUCFqaDhUklgd77k7cLVDFhZid0F31cZY=;
 b=1RQgbE9rtst6lcDTwijBNIvC4GzckhzkNLcECBSw0Yg5xZYw9ug9f05LG1XCBNRFfP
 AA4km4KetgQgFQ/usWu93mkkhN2Xnn13UA5Mp6m05xeNGPnzfYJb5G+HluChTGCOWixK
 GHvDUz+1JlQDsSujygOoxt3n5lJtVuOOkBgRbwwsNLXUIjewHbLB+mg9/jF/qqvQmttH
 6PM4ctCjY8HnTq2sAPgt1fwuryc2Vuurn4SpnH+XOyIVz8P93MTercwUfKvVVIU1nKXH
 XtZGYs9tnyfQnSIbuLbuv3NBFrAFVV+ml3jTFu5YxuIQt+XBRgw99E5K8UxlgiKGz3rH
 w7mQ==
X-Gm-Message-State: AOAM532jSyu4VKIVaSHCHfTrGM/DKx8S3IPZdMt3PyHvKUUuuTyAq8pM
 MHXvGghGcxGnjinLvoKcgcS6kxLChvldkujlSCNASYUsbm49fqt8DEncfwnYza4K+j55GEQZVdZ
 0dInimQjbmYaF108Wqf2stQ6m1oTs/Ok=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr2136848ybl.343.1648040890101; 
 Wed, 23 Mar 2022 06:08:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzpjlg5TyPfPcUtDlh1+J1XY0t7+dRfKAPEu4L5fdqcdDFaZ1pIUVqnpWFbbiSNVStd98s+tXXiQthMduT/o+A=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr2136834ybl.343.1648040889910; Wed, 23
 Mar 2022 06:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220323115021.24763-1-pbonzini@redhat.com>
In-Reply-To: <20220323115021.24763-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 23 Mar 2022 17:07:58 +0400
Message-ID: <CAMxuvazqfXy0Zhy3eAdfR9MBSvdEkHbbcFPBUybERGeTtgr4tQ@mail.gmail.com>
Subject: Re: [PATCH] configure: remove dead int128 test
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 3:50 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  configure | 18 ------------------
>  1 file changed, 18 deletions(-)
>
> diff --git a/configure b/configure
> index 6d9cb23ac5..7c08c18358 100755
> --- a/configure
> +++ b/configure
> @@ -2463,24 +2463,6 @@ else # "$safe_stack" =3D ""
>  fi
>  fi
>
> -########################################
> -# check if __[u]int128_t is usable.
> -
> -int128=3Dno
> -cat > $TMPC << EOF
> -__int128_t a;
> -__uint128_t b;
> -int main (void) {
> -  a =3D a + b;
> -  b =3D a * b;
> -  a =3D a * a;
> -  return 0;
> -}
> -EOF
> -if compile_prog "" "" ; then
> -    int128=3Dyes
> -fi
> -
>  ########################################
>  # check if ccache is interfering with
>  # semantic analysis of macros
> --
> 2.35.1
>


