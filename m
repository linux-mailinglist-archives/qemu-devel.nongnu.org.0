Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDD542B87B
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 09:09:15 +0200 (CEST)
Received: from localhost ([::1]:46784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maYO2-0002hk-5h
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 03:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYN6-00020p-7z
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:08:16 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:39904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1maYN4-0002g8-NQ
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 03:08:15 -0400
Received: by mail-io1-xd33.google.com with SMTP id p68so1674362iof.6
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i8qOUvBmdb1hFG55wRskSWtFVxOmKZrLwsl/7SaYtlI=;
 b=QrfKvnIszAvQ5eQ/OkmojDyd6DLtMYvj9pToMQnUq8A7aRDiR7aZGEtxzzKLPP1dbC
 h338dJVnil9sRANp7BOEZ7QeP3bwru6zhI2HhWpINFubTy6XXIKXBJeepu167rdMWIgj
 P/2ZoPKpGx9Pl+tKUUShfFbNZCOdOe4n7PpDpjS6J1YFfrWzDAMnhSY6hAH2EqnbfP6E
 90YjRJNcEMn9zGhFyswQsTF2t2/TTffijzcQroGJ3638wKfz00AbkDAP/OwHZ0wUplI6
 8KYTWBaQplvnd94laOJz6MNjNk+gb2yH05hz6w8J+S9L6Uf+mJyknymD5awRBH+gkNKk
 Zd4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i8qOUvBmdb1hFG55wRskSWtFVxOmKZrLwsl/7SaYtlI=;
 b=lwOQeyjjzXufpplXcnHJR4b2bbBGr9T5qjK3oyeYPbAHLvq5fpzflVaRhVpd0POXVV
 JJQY0dY/AmwD4fqoQkJYkaePrj+ld0ILuWnHhMxp6YRHIUKhEnsNTCPYAT0A6r2hBFbw
 N9dRhcNIBF0E69YRACEkGXuNIdrJMS9Jbv8QossBIOQxjqdNHTvt6zQSt9fpFVcCfK2D
 W/etUJBTSYptXzpky65td9EgmzvAJNYlnc9kZcPG6qTo+/GnTFn4W3ws54fBjJwwS1Rh
 2DB4YbSfFttw181TJFRfWw+cxTn1DIKlrkl0li9hkHo4mLirhXdr50DQmsuwIufcmGyu
 ookw==
X-Gm-Message-State: AOAM530qWKFSLggJr9f4PC6FFLZdC2gAOHkzvo25h4MSHhkHEK++VfPA
 1TlqP4AC2pyWKzn+U4+vvB2XNYx+q29Pkpq1krc=
X-Google-Smtp-Source: ABdhPJybQXoArtAC02cxtjTHpq+cgkRCAgeN4ZAnXcbDoHIBxNoVCXg6A0TRVmSdoN3ZBfkpNAnO2YJaTEG8xetTqsw=
X-Received: by 2002:a5e:9612:: with SMTP id a18mr26814534ioq.57.1634108892876; 
 Wed, 13 Oct 2021 00:08:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211010174401.141339-1-richard.henderson@linaro.org>
 <20211010174401.141339-5-richard.henderson@linaro.org>
In-Reply-To: <20211010174401.141339-5-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 13 Oct 2021 17:07:46 +1000
Message-ID: <CAKmqyKMZtgnMsO0cJua4PF7cXtC=HaO69odvmMrH1ruD=Qi9LQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] accel/tcg: Add guest_base_signed_addr32 for user-only
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: git@xen0n.name, Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 11, 2021 at 3:52 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While the host may prefer to treat 32-bit addresses as signed,
> there are edge cases of guests that cannot be implemented with
> addresses 0x7fff_ffff and 0x8000_0000 being non-consecutive.
>
> Therefore, default to guest_base_signed_addr32 false, and allow
> probe_guest_base to determine whether it is possible to set it
> to true.  A tcg backend which sets TCG_TARGET_SIGNED_ADDR32 will
> have to cope with either setting for user-only.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

