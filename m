Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E1A2F6B89
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 20:54:34 +0100 (CET)
Received: from localhost ([::1]:56642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l08hV-0008VN-Tr
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 14:54:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08eb-0005Vf-3U
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:51:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1l08eY-0003t1-2h
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 14:51:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610653889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sv3B0/2YuHx6pUw+t5+tBji7qKbdQondTNW28HeC85I=;
 b=DHIVh3jExhWhbtoTpakPuGbPGE9NhR+7t0z47v00ESzAD3o7yGCAEkYAILdnXkbVf6bJIf
 VeUhqizHr7S1836MsgmiK6W67MhlB5eCvhZdLrNZIdysJmU9rvEIkZ9a4EUpRHpELnupzG
 Su2dkE3zfsnqPR3BVElWwAyFl66T1gI=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-ye_5I1ZkNsOCT9iSSgQOoA-1; Thu, 14 Jan 2021 14:51:27 -0500
X-MC-Unique: ye_5I1ZkNsOCT9iSSgQOoA-1
Received: by mail-ua1-f72.google.com with SMTP id 6so577104uay.21
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 11:51:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Sv3B0/2YuHx6pUw+t5+tBji7qKbdQondTNW28HeC85I=;
 b=ardZiMRG9bJGLUHAxe7RKyH0+4Mt7+C0+6vaZpxP0sPBSHP9RzYyNAkQXqMXfGU5Xg
 c7Ckh/WyrKn4pKAX7EWEpCbJWKmOscb3MXndv8gfp2CcqA9ZYWHKCGLcIkVyBJnyHgYZ
 f7tQLQfN5xaIbrbO1B2JDTaV7tEejDS/i0Z5Vk3nDAORXgwFh4nrQc87viONUUNdK4hK
 6c2qoGubbAcAgiiDgAko6DGilwuYMI2obyEN/pptoD9QKy7MTz4+H/arMuQ+iyJL5PlS
 kluXSTAJqokv2uUvW1/5jFn+c5N93GDPWbkqQBa676gx7t9ItXeR/gGIlXYsWo/HlkDM
 9U9w==
X-Gm-Message-State: AOAM531BkHPUEUGWjr2He4byUDvebK1u5w3lanyTlpstoYjbf86slHUJ
 vWfYE2F63qpROU8LkIM+jVdrkXGI8JEd2CTesTJ/7JEyB5sAZG4DRXVAa4KVQhyQIz9M1zdhWpf
 13opBxWVo1o/IC8zw/kLp0HIg+besmG4=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7252376uaq.124.1610653887108; 
 Thu, 14 Jan 2021 11:51:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx89NisrPqVm6yaGpLG2sRmcDG8dehNUx+2u4xa6IoIHCjw7Reh+Qa7Pflq4YEkHTutoJRAWQe2cB9qOnILWqA=
X-Received: by 2002:a9f:240a:: with SMTP id 10mr7252359uaq.124.1610653886895; 
 Thu, 14 Jan 2021 11:51:26 -0800 (PST)
MIME-Version: 1.0
References: <20210114165730.31607-1-alex.bennee@linaro.org>
 <20210114165730.31607-13-alex.bennee@linaro.org>
In-Reply-To: <20210114165730.31607-13-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Thu, 14 Jan 2021 16:51:01 -0300
Message-ID: <CAKJDGDZ-=JvaO7z8qzAR5wPbJ-33rHpVpA_TmBkGMcuQRNOecw@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] scripts/checkpatch.pl: fix git-show invocation
 to include diffstat
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 2:22 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
> Without this checkpatch keeps complaining about new/changed files even
> when MAINTAINERS has been updated. Normal invocations of checkpatch on
> patch files rather than commit IDs are unaffected.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


