Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E74E1300723
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:26:46 +0100 (CET)
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2yKj-0002xF-Pp
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2yJH-0002HK-NS
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:25:15 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:53518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1l2yJD-00073G-Hh
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:25:15 -0500
Received: by mail-wm1-x334.google.com with SMTP id j18so4654116wmi.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=RiuF4rrV+19okC6JPKaxK40vneYgcbkDjFesUwpbgzs=;
 b=eg1C7ZRQldZ5T7iMJEWTqDj76RB8js76TfsV16rM2XhmDCGIBJDH+vvUQ8fVCdMJN4
 TULUQ8NbbIxOQCZdyIxyZjslYSr9YiL71aiGXJI3ZdqjGLU0WeI7cBs6FSyxgNVIK53p
 MHvXWq6i65q9ce5E2dmd/0GJCaYLzSuOyMSZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=RiuF4rrV+19okC6JPKaxK40vneYgcbkDjFesUwpbgzs=;
 b=kbpS4PnX9ugJBL7It3uRMGSQdAr5XLbT9R8k0KFE0s8vyHGYjdmfaNO5TPivzqdUj1
 r21mN4kfKehGj3vbBK/cO5srSlIL0Co+1Zp9ek4rv8ad3HCFpAOqWeBLzeJOuSNjLCyS
 JYClT2TovwhnHbW1/GaOS29kar2jQPywtTbio/JYh4l09B4f+iWI21dx7N4jnlKn53ei
 ZDIVE/lZzM/Lee37cw/kXQBacGhztIqcNOubUFLykrrKjDxvuZ7fBcT9P0iOO0JYE3S9
 vIhub5cb5yxwkqOGA0GjtbIN13vqCzvgdADiCwYX7nk8psV/k512/2J0t0HthjwEybMK
 SDqg==
X-Gm-Message-State: AOAM533C6AaSiPWZ3OzXTKd0laIe39SJC9zyAulSfli2rORDTu9/R6Dv
 FQBs1xOqvbxsVVUDOVy+7RgFIQ==
X-Google-Smtp-Source: ABdhPJwQQ+eGfpUcxCcO+3mSy2SxLibo5SL9peZ8AIpdOoxbd3DNK0FglZrDLbLZuJve2KyUN1HGsA==
X-Received: by 2002:a1c:c257:: with SMTP id s84mr4459708wmf.146.1611329109691; 
 Fri, 22 Jan 2021 07:25:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78?
 ([2001:8b0:aba:5f3c:6d8b:661b:50ff:3a78])
 by smtp.gmail.com with ESMTPSA id g18sm13000487wrw.61.2021.01.22.07.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 07:25:09 -0800 (PST)
Message-ID: <39318d24a69728018ad015ea9899f4acaf7d39be.camel@linuxfoundation.org>
Subject: Re: [Qemu-devel] [PATCH v2 07/11] chardev: Let IOReadHandler use
 unsigned type
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, P J P
 <ppandit@redhat.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>
Date: Fri, 22 Jan 2021 15:25:06 +0000
In-Reply-To: <a77e5084-3fd4-7e6e-1768-87bbfe30866c@redhat.com>
References: <20181012002217.2864-1-philmd@redhat.com>
 <20181012002217.2864-8-philmd@redhat.com>
 <3eefc179e8217ef0ec52080fc003796f70b112fe.camel@linuxfoundation.org>
 <s33o7756-7r9n-329n-6664-99p3o665qoos@erqung.pbz>
 <a77e5084-3fd4-7e6e-1768-87bbfe30866c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wm1-x334.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2021-01-22 at 14:55 +0100, Philippe Mathieu-Daudé wrote:
> Hi Prasad, Richard.
> 
> On 1/22/21 12:52 PM, P J P wrote:
> > +-- On Fri, 22 Jan 2021, Richard Purdie wrote --+
> > > If so can anyone point me at that change?
> > > 
> > > I ask since CVE-2018-18438 is marked as affecting all qemu versions
> > > (https://nvd.nist.gov/vuln/detail/CVE-2018-18438).
> > > 
> > > If it was fixed, the version mask could be updated. If the fix wasn't deemed 
> > > worthwhile for some reason that is also fine and I can mark this one as such 
> > > in our system. I'm being told we only need one of the patches in this series 
> > > which I also don't believe as I suspect we either need the set or none of 
> > > them!
> > > 
> > > Any info would be most welcome.
> > 
> >   -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02239.html
> >   -> https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02231.html
> > 
> > * Yes, the type change fix had come up during patch reviews above, and this 
> >   series implemented the change.
> > 
> > * Series is required IIUC, didn't realise it's not merged.
> 
> Audit from Marc-André pointed that this is unlikely, we asked the
> reporter for a reproducer and got not news, and eventually closed
> this as NOTABUG (not even WONTFIX):
> https://bugzilla.redhat.com/show_bug.cgi?id=1609015

I guessed there some resolution like this but couldn't find it thanks
for the pointer. It's now clear in the archives and I can handle
appropriately rejecting carrying those patches, thanks!

Cheers,

Richard


