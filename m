Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC096CC1B8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 16:08:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9zb-0007ms-47; Tue, 28 Mar 2023 10:08:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cavinnarsinghani@gmail.com>)
 id 1ph5mc-0003ug-7M
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:38:26 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cavinnarsinghani@gmail.com>)
 id 1ph5mY-0001Ld-8e
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 05:38:25 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 mp3-20020a17090b190300b0023fcc8ce113so14517576pjb.4
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 02:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679996300;
 h=to:cc:date:message-id:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to; bh=2TjFAsJBhT1NJ9tsyzd4ep1+aG5EX/rFHTk7wNGNr7o=;
 b=NV0F7CONnnr2SkTRT/Z4sHRoyd1IqRJuuGss1X/xtJ5G5Vj8ou63fFGTLlVPDudZ55
 h1QkGb1/h1Si5wQkAw8ZTjZuRtQAyBGzpX/fpQa0/LN6QmDZf2A4/90bQJLtqpTseF4k
 petsy4kG0KkEhBDo4B6ug0IXspNPo4PfCjBWylYF4/VXKZ3ac90ODG289bGBmrEch3WO
 +8cvORLNlP2m400TVWA7N9XMKcGzWkziRkLHPHs8/HXMgryZdyMLJRwaPEyis3KgqQdL
 C3mYt7zDLnlDBDNfEHI8V6jSl8oPZfUwGyOPtWL/PVZFBknHxE9ZSB039DAscSVJAqcv
 NDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679996300;
 h=to:cc:date:message-id:subject:mime-version:from
 :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2TjFAsJBhT1NJ9tsyzd4ep1+aG5EX/rFHTk7wNGNr7o=;
 b=iVse15N5lEoAXJgLugE4QutSybM8+NMdqdHasUJUiy5aheKXpqYtX2OcAPvzvafihK
 c+3S481lI6+6QKcqG+xRovgwg+XFL8LHXvOjHnSbXFnjn05ytti6J6nVoqBMRjrDTh34
 JS9Pq8B/JMK8kh21BmHxJee4RLVH04SrnJ2G5koQjhuo1LL1LEObN8fFtVglzng/7BEO
 dM7++j3r1JAc+DNXawFT0F7qgIKQNNNbsSN0ejOimurXPWHxaVhXgMgk25AdAGyRHu+G
 vJE/LK48gnSJVqxnFNQesnSxH0SQIA+QZalzVdkfWJpeBM6zkIkc3JIuoNIkDKXDll2j
 1p/w==
X-Gm-Message-State: AAQBX9eDd4QpUKsa+0YI5/kYmvqtE73j6eLtSGuUUwFa+7tzW7pM0yZX
 l7i461CTgV7urDOoLBCL4ss=
X-Google-Smtp-Source: AKy350bGbiGvUuf6O/QxYQvrTjU8pdDwiWMKL2u0r7UWnrZTnqhXfvcUx7HzHpOspo8nRDm4zCseDA==
X-Received: by 2002:a17:90b:4ac1:b0:23b:35f6:4ee6 with SMTP id
 mh1-20020a17090b4ac100b0023b35f64ee6mr15534586pjb.3.1679996300070; 
 Tue, 28 Mar 2023 02:38:20 -0700 (PDT)
Received: from smtpclient.apple ([203.192.235.155])
 by smtp.gmail.com with ESMTPSA id
 lk10-20020a17090b33ca00b00229b00cc8desm1802698pjb.0.2023.03.28.02.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Mar 2023 02:38:19 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary=Apple-Mail-412BC74A-9647-4523-8007-257818EEB6E0
Content-Transfer-Encoding: 7bit
From: cavin narsinghani <cavinnarsinghani@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: Peter Maydell
Message-Id: <BF3FFEF0-8818-40DE-A27E-AA8844ACAEF8@gmail.com>
Date: Tue, 28 Mar 2023 15:08:07 +0530
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
To: Liviu Ionescu <ilg@livius.net>
X-Mailer: iPhone Mail (20D67)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=cavinnarsinghani@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MIME_QP_LONG_LINE=0.001, MPART_ALT_DIFF=0.79, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 28 Mar 2023 10:08:01 -0400
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


--Apple-Mail-412BC74A-9647-4523-8007-257818EEB6E0
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">=EF=BB=BF<div>Yes, I agree=
.</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Fri, 20 Nov 2020 at 2:58 PM, Liviu Ionescu &lt;<a href=3D"mailto:ilg=
@livius.net">ilg@livius.net</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-lef=
t-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
<br>
&gt; On 20 Nov 2020, at 10:54, Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@=
redhat.com" target=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; new m1 ... Richard Henderson and Joelle van Dyne are working on it<br>
<br>
Ok, it's good to know that someone takes care of this.<br>
<br>
Personally I think that the new Apple hardware is great, but to match develo=
per needs it might need a few more months to bring up all necessary tools, Q=
EMU included.<br>
<br>
<br>
Regards,<br>
<br>
Liviu<br>
<br>
</blockquote></div></div>
</div></body></html>=

--Apple-Mail-412BC74A-9647-4523-8007-257818EEB6E0--

