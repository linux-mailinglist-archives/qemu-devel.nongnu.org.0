Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E0315658
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 19:54:51 +0100 (CET)
Received: from localhost ([::1]:35148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Y9y-0006Is-Pz
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 13:54:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Y1Q-0004iO-Hc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:46:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27141)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l9Y1K-0004a6-Mm
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 13:46:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612896353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=70ek4UoAXxp5EGw3jVZ43NiweMqVgn7jDKN09/RA2xM=;
 b=Jjv7xxYaC57fM/qyXDVFwsf8B/uxOOBp0+8QpeRHCX0TQ5ksSGLlZBiGfOhhYyZV62o1o6
 w+eNDyeyW7B+1DOl9m4Bo2oOjVQ8VhqgFCmKdUfSMOShC1wE5cjlAWHQJmHdEyZ/fVFf4R
 K8XPoQTD1tYNiNdljHEmAgvg2XMM/8Q=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-sPAUyfkmMWebG9M1X5yhBg-1; Tue, 09 Feb 2021 13:45:51 -0500
X-MC-Unique: sPAUyfkmMWebG9M1X5yhBg-1
Received: by mail-pl1-f198.google.com with SMTP id o8so10134955pls.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 10:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=70ek4UoAXxp5EGw3jVZ43NiweMqVgn7jDKN09/RA2xM=;
 b=gZtFWe1Sw+/PtTkus6Z9J4Vg6c607Kwrg72Jg748cw45JHxPp0LoR4jmWt76UBZp7G
 QZGu3hjwcry7m/7ccDr+WVn/PdRwrXS3mPnb2Q42GkUwoG22C3UmsY/FAUVROvjUnvrb
 Lvv3uyg8tLUwQPR3cUQnarUTeGgLwxwLtPl3kZPJueXODbdJKolR2IAh04zHDaipcRme
 ApZgA7tNzS6jm4SP+XyvqXISy9ofe2N/9ysYmLDp0Y18Okpa+tBqnZc84nVdr39dKVfJ
 N1yzNhrkYQ5YqJttH9U/YNJWTvbesruqHXnNHoxYtSdfubDLm6tz40Pb0LzCYR04P/aJ
 Gtxw==
X-Gm-Message-State: AOAM5331X7EBNQNKiSxGJIfKk487ecePlQ9NMJvRgfwJHOs5cLPPSLWa
 BYtmVMCyDMUcIU5pITIa9aC3GJSjMhaZo75PJ9YY6OVzSErT8yRAqXpNLFhsBJUx4X+G0OX6FQB
 1efFYhOwkHV4tdOl0TI0L1eqjNBnKOmU=
X-Received: by 2002:a65:4201:: with SMTP id c1mr23103623pgq.10.1612896350390; 
 Tue, 09 Feb 2021 10:45:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4v2ypVe2idThm7aq/1PUiOlmx430sn+S2IWUGcLPvrOMx5Ad6W96AphxPsm4smY+IB7XsZUwBw0ew9H73ZGE=
X-Received: by 2002:a65:4201:: with SMTP id c1mr23103610pgq.10.1612896350186; 
 Tue, 09 Feb 2021 10:45:50 -0800 (PST)
MIME-Version: 1.0
References: <20210209174541.150011-1-pbonzini@redhat.com>
 <9825c4c6-ae01-57ee-6616-86eba1d3b04d@linaro.org>
In-Reply-To: <9825c4c6-ae01-57ee-6616-86eba1d3b04d@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 9 Feb 2021 19:45:38 +0100
Message-ID: <CABgObfbj_6SBUc=3ujDNT+TiGuL4_BoVYD77-Gh9YRyiOGHvtQ@mail.gmail.com>
Subject: Re: [PATCH] meson: adjust timeouts for some slower tests
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000352e805baebb2d5"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "P. Berrange, Daniel" <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000352e805baebb2d5
Content-Type: text/plain; charset="UTF-8"

Il mar 9 feb 2021, 18:54 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> >           env: qtest_env,
> >           args: ['--tap', '-k'],
> >           protocol: 'tap',
> > +         timeout: 30 * slow_qtests.get(test_name, 1),
>
> Why scale here, rather than putting the real time in the dict?


Sure. In retrospect that isn't really useful.

Paolo

  Is there some
> other scaling going on that I can't see?
>
>
> r~
>
> >           suite: ['qtest', 'qtest-' + target_base])
> >    endforeach
> >  endforeach
> >
>
>

--0000000000000352e805baebb2d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mar 9 feb 2021, 18:54 Richard Henderson &lt;<a href=
=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>&g=
t; ha scritto:</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0env: qtest_env,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0args: [&#39;--tap&#39;, &#39;-=
k&#39;],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0protocol: &#39;tap&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0timeout: 30 * slow_qtests.get(test_=
name, 1),<br>
<br>
Why scale here, rather than putting the real time in the dict?</blockquote>=
</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Sure. In retrospe=
ct that isn&#39;t really useful.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">=C2=A0 Is there some<br>
other scaling going on that I can&#39;t see?<br>
<br>
<br>
r~<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0suite: [&#39;qtest&#39;, &#39;=
qtest-&#39; + target_base])<br>
&gt;=C2=A0 =C2=A0 endforeach<br>
&gt;=C2=A0 endforeach<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000000352e805baebb2d5--


