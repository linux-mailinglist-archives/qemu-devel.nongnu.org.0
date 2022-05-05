Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585B551BADC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:44:47 +0200 (CEST)
Received: from localhost ([::1]:41274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmX6M-0002Ta-Dx
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmWwH-0002nN-U4
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:34:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nmWwF-0003Cv-3b
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:34:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651739658;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ytq1KCGGtFa78gSx9OvZGsBBGkHZ2qd9M6MqtdRjrD4=;
 b=CDiFIjmWGOECxSpiTCVsBPolqr9MOcNHLLyK2AIK2H3cPfkw/U65Qp9N3nmEhaIglQRZ65
 wwOfxw/P4VjfZW/Sbj8Ylckc7IsiOTJ1511CVXHxZDLTqjF+99ilqIZznoPdDH8EOR5Jym
 nyG/oBr3lj48/pneME5oxiESTpg0M+0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-0tzwcPMpOfiK7Jqj13Ty0w-1; Thu, 05 May 2022 04:34:17 -0400
X-MC-Unique: 0tzwcPMpOfiK7Jqj13Ty0w-1
Received: by mail-pj1-f71.google.com with SMTP id
 g11-20020a17090a640b00b001dca0c276e7so1925919pjj.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 01:34:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ytq1KCGGtFa78gSx9OvZGsBBGkHZ2qd9M6MqtdRjrD4=;
 b=TWysDpH+qlGtHi/5yVWYTFJWSskcWmP/bFbKoEEyeiiRAUQw7ySt8TobDwWcNVW+/c
 rlIDRnMrZZRbxi4T4H7RmFlyLMHswGxWxKkabdFRV2XAE48yk+UftakiJ3ZlsXw5SqMH
 6drlyWFBX/tcTod5lYrCeYBn2VU0pWiiEzUWRAJeqFo6v2QtpuLzWK7yEfEzs1d7rTQG
 /U9/GiUySIpMfbGDQrMdQvJF0ZD/a47nkoTICJK7WAJQ/funlx+2/bTdjRwqnVxdFbUn
 KWCjT6LmIOBqAJyOVe59hnJjsHIEEyFkXIW4yJLPAfl/T9JgUqtVYZcAUEOND3d0GGex
 k0QA==
X-Gm-Message-State: AOAM530FxrAUdNhu8bwBHc6kSLw1cwEiYGxgWFvvCus63kcbHmxLaNXD
 D5MOBy825sEq6ET+0l5rSxtMgmBY+6VGPjrreSYR0wHx+7hVNhZHQzr8uFKe3LQsNaGdlSJsWrf
 hiGbQii7IhFrt6McY2kh57tx43hT5aPk=
X-Received: by 2002:a65:60d3:0:b0:39c:f431:5859 with SMTP id
 r19-20020a6560d3000000b0039cf4315859mr21211404pgv.442.1651739656105; 
 Thu, 05 May 2022 01:34:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEXEKVbw8hdobs1qoa7efzu8UjN+dRJMx8TsI0QMakJh4lTiHfObQMlxL+qNAsY31o9cPBf2aIiTLGiJR0BKE=
X-Received: by 2002:a65:60d3:0:b0:39c:f431:5859 with SMTP id
 r19-20020a6560d3000000b0039cf4315859mr21211392pgv.442.1651739655824; Thu, 05
 May 2022 01:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220504210001.678419-1-pbonzini@redhat.com>
 <20220504210001.678419-2-pbonzini@redhat.com>
 <CAJ+F1CJgNMcVNFsctNR9MAaQ_5XojbX1J=LgjsVqyveArW6Xuw@mail.gmail.com>
In-Reply-To: <CAJ+F1CJgNMcVNFsctNR9MAaQ_5XojbX1J=LgjsVqyveArW6Xuw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 5 May 2022 10:34:04 +0200
Message-ID: <CABgObfY=YNOPa0DjqEgWkeZZOCrOJAco1xfnmSjYSme8T=KcOQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] slirp: bump submodule to 4.7 release
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Daniele Buono <dbuono@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.74; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 5, 2022 at 10:21 AM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
>
>
> On Thu, May 5, 2022 at 1:06 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>>
>> Version 4.7 of slirp provides a new timer API that works better with CFI=
,
>> together with several other improvements:
>>
>> * Allow disabling the internal DHCP server !22
>> * Support Unix sockets in hostfwd !103
>> * IPv6 DNS proxying support !110
>> * bootp: add support for UEFI HTTP boot !111
>>
>> and bugfixes.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Unfortunately this fails to build on Windows due to a libslirp bug
(https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/121).
We could include the couple extra commits in QEMU, since there are no
other changes to libslirp since 4.7.0 and they only fix a compiler
warning; or wait for 4.7.1 to be released; or resuscitate the patches
that switch libslirp to a subproject, but that's my least favorite
because we're going to remove the bundled source code anyway sooner or
later.

Paolo


