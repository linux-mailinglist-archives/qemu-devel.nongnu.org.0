Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C33FA2CBB9E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 12:36:03 +0100 (CET)
Received: from localhost ([::1]:58704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkQQS-0007RC-FL
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 06:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkQNv-0005sx-9j
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:33:23 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kkQNo-0005FN-1I
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 06:33:23 -0500
Received: by mail-wm1-x341.google.com with SMTP id f190so7051027wme.1
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 03:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=c9mB3ZD2VebjQi9QTKNdq4TpoypJK4HZFuIo85yTvDA=;
 b=p36NSYgphfH/+RzXk+nDvXKu3pfRitdsu0sd1LyLAmZyNgrmQJaptur8yGfUGpUKLq
 WAN3nBSn5snKoG88hfuwrtjPQYaR54dU+iGeDzHwWs9btq5oP8YOQtoQ+lGO3EYXR9Gc
 RpK5v+7xR8o6anx34AkvpNfLZum0sg7cO9/LYwrYcM6lK3AGCQp6V2C6d7to489MQIQL
 jUhDhPKkmE5D1bt/VOXHTrMEeozDTEIdx7BiHYbqmjao8CWwisRaWU345hozMSrWqo8G
 SCOx385xA02Mclaz1lqA7ZydT4EFzZjQ4/dVETjyETictcszTnBWlaII7m+kAftarqa9
 s+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=c9mB3ZD2VebjQi9QTKNdq4TpoypJK4HZFuIo85yTvDA=;
 b=Jwd1Kado8zyQUOQuwdGhtJ7sVksij9BWHRxAMTfTv/tJVBcaCOwOAT6ApZFKjdf3u2
 JCmVVXSAc2AP4PuGy94gBEtjwK3HKFxtjm24W0sKCB+7LabaS6VmbmAysr/Nwsmp/dd7
 Vcu34wYkBYVEq6ac5LIi//njb3EOpupPaG8WjRkGpE0B+Jwxx5HktuuJLPp9lMvyvjIF
 ieN0NWbL6cOmT8CzJiguqGLy5mBbQWZbqWhHxSrmEdgWNovcS/CxImRJuGtrt3Pu8UmG
 vcslFMIR7utcQksp5wANFu6Yo7IaKqXOC33u8yKEKW5hCjjP23nHeR75Tld0CNq/U7lN
 CCVg==
X-Gm-Message-State: AOAM53147ukp6bgY1HJSC9ZmDTUVrnok/3YleT5i4Kgkd39+z/CKC4NX
 zOh0JnMiMePRPRJjInOvMvk19qRf100QMQ==
X-Google-Smtp-Source: ABdhPJwskB88vFXQt8W/Is3z+gxmtbqEscDX2Ig8QT80RDJk3Dmce0Q96Dlt7pbgfNK62IH93B5rbg==
X-Received: by 2002:a7b:c5c6:: with SMTP id n6mr2580885wmk.131.1606908793811; 
 Wed, 02 Dec 2020 03:33:13 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c4sm1101889wmf.19.2020.12.02.03.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 03:33:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A2D2D1FF7E;
 Wed,  2 Dec 2020 11:33:11 +0000 (GMT)
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-13-pbonzini@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 12/15] plugin: propagate errors
In-reply-to: <20201202081854.4126071-13-pbonzini@redhat.com>
Date: Wed, 02 Dec 2020 11:33:11 +0000
Message-ID: <87sg8osars.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x341.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> qemu_finish_machine_init currently can only exit QEMU if it fails.
> Prepare for giving it proper error propagation, and possibly for
> adding a plugin_add monitor command that calls an accelerator
> method.
>
> While at it, make all errors from plugin_load look the same.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

