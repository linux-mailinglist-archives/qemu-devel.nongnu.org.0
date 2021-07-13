Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 850C33C7672
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 20:27:46 +0200 (CEST)
Received: from localhost ([::1]:60166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3N8D-0001LQ-Aa
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 14:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m3N7H-0000gx-IJ
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:26:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m3N7E-0004eE-Sw
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 14:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626200804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=MtprzZXkyaZupioOmHpgbAD2M9qyHP50Xg/pROhPNPQ=;
 b=Zhe7zZ57do5qq2NQDU/qjrDZVz49J6Twu1RsPsZSj0ScYBsqH3toOTBqzNqFyBpU8g/Dy+
 apmrGm/skDPBIMtkRpuBw1KlvIODVzxiIlrqXLjJTflh3qHazAATy2V4AuU8pSxGn++xFl
 tjz1BZpcyNscZFLGvhVfhsjMnkz0P+k=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-bjftjzzlOYSHXF1hVoJgkA-1; Tue, 13 Jul 2021 14:26:40 -0400
X-MC-Unique: bjftjzzlOYSHXF1hVoJgkA-1
Received: by mail-oo1-f72.google.com with SMTP id
 d12-20020a4aeb8c0000b029023bbaaddcbbso10298189ooj.13
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 11:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=MtprzZXkyaZupioOmHpgbAD2M9qyHP50Xg/pROhPNPQ=;
 b=popBXQtgH6XUOLEYNJPrmX8N6081uGcq/Kmf0paH7RTuOxoWaPtjUMCgQahBhXEW6Z
 jhw8QbHZL25HNSzFS5PThL8Joi9iNeJdlbqpjCj/piBLJff5Pa075lFfwgi7KXKx8/0T
 017r7Hcvi9DZg88S3TyEOEoe89OcMj/qDyxeWbGtTK1hc4r6+2chQy/VHfTWMDKXN7rE
 wZYz8JVzqWvF6WKRx/MlgsC+jsaIDy53euPjd4lWaJYJCZPIO0OTjQOWW0dOzcoaQUuW
 LnnWqAwSCFLfhV/zw919QuHv9c4FhTSSO9IY2JdDrpELeNZjIIa24VSgorDA6zvl7LQr
 FPGg==
X-Gm-Message-State: AOAM530+TxU4yJZ0v1qo/5pS8c97mhMSj/SKLuWVSolkNNF4rb3BXk+h
 ybvCaZgL+uCWyFN91YN3dEOsyfYT7RsD00Rb/1bqaQ6j9A37qqzawhqgndHVyGShSGSIDviJ3h/
 3XmoxIy2XaTsxX1TmLQdSiWfNs89sfXc=
X-Received: by 2002:aca:2212:: with SMTP id b18mr4113055oic.52.1626200799473; 
 Tue, 13 Jul 2021 11:26:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgHNUUkesvJ4omvtG+Ilgn7METUauE8+oS4Pjv25jSbrRknv5IN3aQ4sZ65MBK5nCMGN/WmN4qrqAt+vBrhRU=
X-Received: by 2002:aca:2212:: with SMTP id b18mr4113044oic.52.1626200799255; 
 Tue, 13 Jul 2021 11:26:39 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Tue, 13 Jul 2021 14:26:28 -0400
Message-ID: <CAFn=p-Y_j0fQJCGHrwryk9=7qjPPU6VHYiOSqiAuz==Mn2s4jw@mail.gmail.com>
Subject: License advice for Async QMP
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f932d805c70560ac"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Eric Blake <eblake@redhat.com>, Luiz Capitulino <lcapitul@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f932d805c70560ac
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm deep into writing a new Async QMP library for QEMU, one that I intend
to ship outside of our castle walls and host on PyPI.

I need to choose a license for it. I slapped GPLv2 on it in keeping with
the license on the original library by Luiz Capitulino (And it is generally
my preference), but I was debating loosening the license to MIT so that it
plays nicer with Apache-licensed projects. ...Maybe.

I don't know if that's really necessary, though, and I do generally prefer
a "copyleft" to "permissive" these days.

My current understanding:

1. Apache-licensed projects probably cannot vendor GPL code of any kind
(v2, v3, LGPL)
2. Apache-licensed projects can *probably* import GPL'd Python code (v2,
v3, LGPL) at runtime without creating a "derivative work", but it isn't a
settled matter, legally.
3. LGPL has little or no effect on a Python library, because you do not
link against Python as such to produce a combined work -- The PIP installer
generally re-acquires the original distribution and uses that at runtime
instead, which avoids legal hassle from bundling GPL code.
4. I would *probably* need a permissive license only if I wanted to allow
the vendoring of this Python code by non-GPL projects.

Does that sound about right?

--000000000000f932d805c70560ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m deep into writin=
g a new Async QMP library for QEMU, one that I intend to ship outside of ou=
r castle walls and host on PyPI.</div><div><br></div><div>I need to choose =
a license for it. I slapped GPLv2 on it in keeping with the license on the =
original library by Luiz Capitulino (And it is generally my preference), bu=
t I was debating loosening the license to MIT so that it plays nicer with A=
pache-licensed projects. ...Maybe.</div><div><br></div><div>I don&#39;t kno=
w if that&#39;s really necessary, though, and I do generally prefer a &quot=
;copyleft&quot; to &quot;permissive&quot; these days.<br></div><br><div>My =
current understanding:</div><div><br></div><div>1. Apache-licensed projects=
 probably cannot vendor GPL code of any kind (v2, v3, LGPL)<br></div><div>2=
. Apache-licensed projects can *probably* import GPL&#39;d Python code (v2,=
 v3, LGPL) at runtime without creating a &quot;derivative work&quot;, but i=
t isn&#39;t a settled matter, legally.</div><div>3. LGPL has little or no e=
ffect on a Python library, because you do not link against Python as such t=
o produce a combined work -- The PIP installer generally re-acquires the or=
iginal distribution and uses that at runtime instead, which avoids legal ha=
ssle from bundling GPL code.</div><div>4. I would *probably* need a permiss=
ive license only if I wanted to allow the vendoring of this Python code by =
non-GPL projects.<br></div><div><br></div><div>Does that sound about right?=
<br></div></div>

--000000000000f932d805c70560ac--


