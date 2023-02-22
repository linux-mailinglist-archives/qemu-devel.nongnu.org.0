Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200869F7CA
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:30:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUr3V-0003CX-JP; Wed, 22 Feb 2023 10:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUr3P-0003Bi-O5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUr3O-0006AE-16
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677079748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEwdPokAbbqe1nF6vjM+rc1+0OsPBZGRugyuRQTmWRY=;
 b=huiVCeDhTdOe6MbjQNuI+nFc2brj7RpQWGP7G/vEui3o2pMYKoQVvHxu/QwvaQM5ZoFp9H
 dlRpYHx9h+3AtN20kL1I/2E9gTVnEUP0QnaFhNKtO2vGvexc+0hg8kjKhVs+wp/8EYCfrs
 SkdQofBO+oFizCynvJpUuf+J56tfeb4=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-S13RVYJCMhOPboB9vt73Xw-1; Wed, 22 Feb 2023 10:29:07 -0500
X-MC-Unique: S13RVYJCMhOPboB9vt73Xw-1
Received: by mail-pf1-f200.google.com with SMTP id
 cn3-20020a056a00340300b0059085684b50so4127417pfb.16
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677079746;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEwdPokAbbqe1nF6vjM+rc1+0OsPBZGRugyuRQTmWRY=;
 b=5Zq2jp3T2fnH/pKonTb39RkJ1/eIPTPBnsj4gU1oDYCzLqCXiu9FmBBvjx9nXUG4jE
 NPdOt5nQ+F/dL66IGwvP6FR0679vTjexPB8Bx/U3O4DkWl/DqD70I1vyx88fFiYqS2nq
 51wFMqzwAaDd3PEmxzTi7bGO2c/NrdK0J9jT/hYPu8J4Jj8mw9ntBqw8EsmmBgnoM5wX
 p6qEO5WeehooC1rW1alcH9uGhEJn5AmfcEfs0VuXfq/iwK/hBhLBEohQB3WfPY/CAoQG
 0FUWxMhIYBrR4+SSeAk6tgfHNgyr6BjYX4IOu5OwaXT+xyUmz1o7L/hpYcCIyiMHZo4N
 fLpg==
X-Gm-Message-State: AO0yUKUwMEy3h087HKUB/b9lg7WFmsy7cIVhBq/N8DXPSJYYbXEjPbGe
 zLP1aeMVyo6VGV5ORugw6UItV02tLTAhAsory4y/VZ1zpiB/c4jMONiRlaVmEMvCGZQTbNIhkzM
 /AzJKn+Tq8tXaHETPxy/0R5VXqp5Zw/M=
X-Received: by 2002:aa7:8c45:0:b0:5d7:6a99:5371 with SMTP id
 e5-20020aa78c45000000b005d76a995371mr264261pfd.19.1677079746092; 
 Wed, 22 Feb 2023 07:29:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+41SGsNyEVfXRNHcyZLAYYeY7D2n0mo/uHsH+v5oW+/5K3kVSod3im8vnULOd82l+5aGBDKq0x91SqxTtrXjs=
X-Received: by 2002:aa7:8c45:0:b0:5d7:6a99:5371 with SMTP id
 e5-20020aa78c45000000b005d76a995371mr264250pfd.19.1677079745735; Wed, 22 Feb
 2023 07:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20230222143752.466090-1-pbonzini@redhat.com>
 <20230222143752.466090-10-pbonzini@redhat.com>
 <Y/Yxx3Awi9q6LRNg@redhat.com>
In-Reply-To: <Y/Yxx3Awi9q6LRNg@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 22 Feb 2023 16:28:52 +0100
Message-ID: <CABgObfaE_OJtRHeDnTJqn55vn2Hx-7EyS7fKRUG4TEmxvSi0aw@mail.gmail.com>
Subject: Re: [PATCH 09/10] Python: Drop support for Python 3.6
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, jsnow@redhat.com, peter.maydell@linaro.org, 
 thuth@redhat.com, alex.bennee@linaro.org, armbru@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Feb 22, 2023 at 4:17 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
> Your updated support policy doc patch could be included in
> this series perhaps.

It is already in a pull request. :)

Paolo


