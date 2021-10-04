Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE724218EE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:05:30 +0200 (CEST)
Received: from localhost ([::1]:54884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXV9O-0007LD-0n
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV5y-0005FQ-3M
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:01:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mXV5s-0003Mv-7w
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:01:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633381311;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=4OH/qVvL0J4jpjOQE10ulVdZjIOwTo+FxqnIThQBiO0=;
 b=Y3jk3VtQ+uROooK2LloGWVpcJcvz87b0Ib01BxZKQ4+VlvGSq+wtTmexqZ4kxw2oi7Rfer
 VuqX0Wg6V/ucpN4MeMXteipeG8896PjjS6SANecUl9C6noU6PxEkS1WIkITVMeMz37Cm43
 1Ei0Z7YJwViT7JBvElYs7t+hbrOHIYc=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-egQDh8E3Phy3yQht4WDlRw-1; Mon, 04 Oct 2021 17:01:47 -0400
X-MC-Unique: egQDh8E3Phy3yQht4WDlRw-1
Received: by mail-il1-f198.google.com with SMTP id
 j10-20020a056e02154a00b002589ce2af7dso11476134ilu.13
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 14:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:reply-to:sender:message-id:date
 :subject:from:to;
 bh=uWur9HYWs4hJSybv3ma+NINco1A5/nctStwRNVQpByU=;
 b=QpxLPS+jeW4LGiLNXuRfz2IM6IyeQBbiFQm2PQeFDENDRbQW7fn2hRDqsbL9phhWfe
 K7FzQJEe1lkqXfw/eK4Cr5k7PBhl+YxwDobIF2rvA6bICwJyJdHjHtTIrMBxK8g7pwof
 tyJYRn1yYTfiuwidBU+X2e62pGkrvzzPLVWFJMnYcB00YSMetfZ8hVzEAUe835QchiBH
 PeZvn3REVn6APxsJ0RGvGMLeFSuaJzpd0uTvrX5ghHk50elar5Q6bMZwySGv8T6KRF7h
 X0aapG4Wi8cupWdq5tr7QI/KI54dpi+WMMUvzdYYqV/atOim0D1oE0q0a/QmojhHcP40
 WaoA==
X-Gm-Message-State: AOAM532mEKkxRLPWqeDGrxoMSY9UorCTskGkOgfDGi9aX9JU48SVHzno
 5vAUvxre97VHOfTPkRvpDx1vy4PwnwlL8XUAxEMfjyFZyyWBXdSHWBmcJkEFAvqojSj2swYemB4
 gKKvg4xJur4EkZQa6Gq7qCopV0fZmXzZQN12pcg2v0lsOaRvcvU4zK0hEpP/2r1137mIak72Q19
 n655nP
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr184140ils.224.1633381307077; 
 Mon, 04 Oct 2021 14:01:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwM/Oo0QK+NeI+GKHnMsoTeGRa65qdk/afx9ZRZJzAtPUn7cFDhAdulZ632pX2GDPBxAWX1GJgtXyvRYiseDIoL
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:893:: with SMTP id
 z19mr184122ils.224.1633381306820; 
 Mon, 04 Oct 2021 14:01:46 -0700 (PDT)
Message-ID: <00000000000093852d05cd8d38f6@google.com>
Date: Mon, 04 Oct 2021 21:01:46 +0000
Subject: Invitation: QAPI Sync meeting @ Thu Oct 7,
 2021 9am - 10am (EDT) (qemu-devel@nongnu.org)
From: jsnow@redhat.com
To: qemu-devel@nongnu.org, berrange@redhat.com, pbonzini@redhat.com, 
 armbru@redhat.com, damien.hedde@greensocs.com, marcandre.lureau@redhat.com, 
 kwolf@redhat.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000093850d05cd8d38f5"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTTPS_HTTP_MISMATCH=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000093850d05cd8d38f5
Content-Type: multipart/alternative; boundary="00000000000093850a05cd8d38f3"

--00000000000093850a05cd8d38f3
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Content-Transfer-Encoding: base64

WW91IGhhdmUgYmVlbiBpbnZpdGVkIHRvIHRoZSBmb2xsb3dpbmcgZXZlbnQuDQoNClRpdGxlOiBR
QVBJIFN5bmMgbWVldGluZw0KTGV0J3MgZGlzY3VzcyBvdXIgb25nb2luZyBhbmQgZnV0dXJlIHdv
cmsgb24gdGhlIFFBUEkgZ2VuZXJhdG9yIGFuZCBjbG9zZWx5ICANCnJlbGF0ZWQgaW50ZXJmYWNl
cyBmb3IgUUVNVS4NCg0KUGxlYXNlIHByZXBhcmUgZm9yIHRoZSBtZWV0aW5nIGJ5IHdyaXRpbmcg
YSBzbWFsbCBvdmVydmlldyBvZiB5b3VyIHBlbmRpbmcgIA0KYW5kIGZ1dHVyZSB3b3JrLCBhbmQg
dGhlIGdvYWxzIHRoYXQgbW90aXZhdGUgdGhvc2Ugd29ya3MuIElmIHlvdSBzZW5kIHRoaXMgIA0K
c3VtbWFyeSB0byB0aGUgbWFpbGluZyBsaXN0IGJlZm9yZWhhbmQsIHdlJ2xsIGhhdmUgdGhlIG9w
cG9ydHVuaXR5IHRvIHNraW0gIA0KaXQgcHJpb3IgdG8gdGhlIG1lZXRpbmcuDQoNCkkgYW0gc3Vn
Z2VzdGluZyB3ZSB1c2UgYSBwdWJsaWMgZXRoZXJwYWQgaW5zdGFuY2UgdG8ga2VlcCBub3RlcyBk
dXJpbmcgdGhlICANCm1lZXRpbmc6IGh0dHBzOi8vZXRoZXJwYWQud2lraW1lZGlhLm9yZy9wL3Fh
cGktc3luYw0KDQpEdXJpbmcgdGhpcyBtZWV0aW5nLCBJJ2QgbGlrZSB0byBhc3NlbWJsZSBhIGxp
c3Qgb2YgYWxsIG9uZ29pbmcgUUFQSSB3b3JrICANCmFuZCBiZWdpbiB3b3JrIG9uIGNyYWZ0aW5n
IGEgcm9hZG1hcCB0aGF0IGhlbHBzIGRlc2NyaWJlIHRoYXQgd29yay4NCg0KSSBkb24ndCBzdXNw
ZWN0IHdlJ2xsIGZpbmlzaCBpbiBhIHNpbmdsZSBtZWV0aW5nLCBidXQgaXQgbWF5IGJlIGEgaGVs
cGZ1bCAgDQpwcmltZXIgZm9yIGZvbGxvdy11cCBkaXNjdXNzaW9ucyBvbiB0aGUgTUwuDQpXaGVu
OiBUaHUgT2N0IDcsIDIwMjEgOWFtIOKAkyAxMGFtIEVhc3Rlcm4gVGltZSAtIE5ldyBZb3JrDQoN
CkpvaW5pbmcgaW5mbzogSm9pbiB3aXRoIEdvb2dsZSBNZWV0DQpodHRwczovL21lZXQuZ29vZ2xl
LmNvbS94cWktdGlxcy14cno/aHM9MjI0DQoNCkpvaW4gYnkgcGhvbmUNCihVUykgKzEgOTI5LTI0
OS00ODU0IChQSU46IDYzNzM3OTI0MCkNCg0KSm9pbiB1c2luZyBTSVANCjY3NzkwNjcwMjMxMDVA
Z21lZXQucmVkaGF0LmNvbSAoSUQ6IDY3NzkwNjcwMjMxMDUpDQoNCk1vcmUgam9pbmluZyBvcHRp
b25zOiBodHRwczovL3RlbC5tZWV0L3hxaS10aXFzLXhyej9waW49Njc3OTA2NzAyMzEwNSZocz0w
DQoNCkNhbGVuZGFyOiBxZW11LWRldmVsQG5vbmdudS5vcmcNCldobzoNCiAgICAgKiBqc25vd0By
ZWRoYXQuY29tIC0gb3JnYW5pemVyDQogICAgICogYmVycmFuZ2VAcmVkaGF0LmNvbQ0KICAgICAq
IHBib256aW5pQHJlZGhhdC5jb20NCiAgICAgKiBhcm1icnVAcmVkaGF0LmNvbQ0KICAgICAqIGRh
bWllbi5oZWRkZUBncmVlbnNvY3MuY29tDQogICAgICogbWFyY2FuZHJlLmx1cmVhdUByZWRoYXQu
Y29tDQogICAgICoga3dvbGZAcmVkaGF0LmNvbQ0KICAgICAqIHFlbXUtZGV2ZWxAbm9uZ251Lm9y
Zw0KDQpFdmVudCBkZXRhaWxzOiAgDQpodHRwczovL2NhbGVuZGFyLmdvb2dsZS5jb20vY2FsZW5k
YXIvZXZlbnQ/YWN0aW9uPVZJRVcmZWlkPU56SndZWFk0WVRscFlqQnRORGxyT0hGeU9XaHFhV0pu
WnpjZ2NXVnRkUzFrWlhabGJFQnViMjVuYm5VdWIzSm4mdG9rPU1UWWphbk51YjNkQWNtVmthR0Yw
TG1OdmJUQXhZVE5rTlRrME5UUXlPV05rTkRrNFl6Z3hZVFkxWkRkaE1UYzNPRE0zTnpBeU9UZzBN
ek0mY3R6PUFtZXJpY2ElMkZOZXdfWW9yayZobD1lbiZlcz0wDQoNCkludml0YXRpb24gZnJvbSBH
b29nbGUgQ2FsZW5kYXI6IGh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxlbmRhci8NCg0K
WW91IGFyZSByZWNlaXZpbmcgdGhpcyBjb3VydGVzeSBlbWFpbCBhdCB0aGUgYWNjb3VudCBxZW11
LWRldmVsQG5vbmdudS5vcmcgIA0KYmVjYXVzZSB5b3UgYXJlIGFuIGF0dGVuZGVlIG9mIHRoaXMg
ZXZlbnQuDQoNClRvIHN0b3AgcmVjZWl2aW5nIGZ1dHVyZSB1cGRhdGVzIGZvciB0aGlzIGV2ZW50
LCBkZWNsaW5lIHRoaXMgZXZlbnQuICANCkFsdGVybmF0aXZlbHkgeW91IGNhbiBzaWduIHVwIGZv
ciBhIEdvb2dsZSBhY2NvdW50IGF0ICANCmh0dHBzOi8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxl
bmRhci8gYW5kIGNvbnRyb2wgeW91ciBub3RpZmljYXRpb24gIA0Kc2V0dGluZ3MgZm9yIHlvdXIg
ZW50aXJlIGNhbGVuZGFyLg0KDQpGb3J3YXJkaW5nIHRoaXMgaW52aXRhdGlvbiBjb3VsZCBhbGxv
dyBhbnkgcmVjaXBpZW50IHRvIHNlbmQgYSByZXNwb25zZSB0byAgDQp0aGUgb3JnYW5pemVyIGFu
ZCBiZSBhZGRlZCB0byB0aGUgZ3Vlc3QgbGlzdCwgb3IgaW52aXRlIG90aGVycyByZWdhcmRsZXNz
ICANCm9mIHRoZWlyIG93biBpbnZpdGF0aW9uIHN0YXR1cywgb3IgdG8gbW9kaWZ5IHlvdXIgUlNW
UC4gTGVhcm4gbW9yZSBhdCAgDQpodHRwczovL3N1cHBvcnQuZ29vZ2xlLmNvbS9jYWxlbmRhci9h
bnN3ZXIvMzcxMzUjZm9yd2FyZGluZw0K
--00000000000093850a05cd8d38f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<span itemscope itemtype=3D"http://schema.org/InformAction"><span style=3D"=
display:none" itemprop=3D"about" itemscope itemtype=3D"http://schema.org/Pe=
rson"><meta itemprop=3D"description" content=3D"Invitation from jsnow@redha=
t.com"/></span><span itemprop=3D"object" itemscope itemtype=3D"http://schem=
a.org/Event"><div style=3D""><table cellspacing=3D"0" cellpadding=3D"8" bor=
der=3D"0" summary=3D"" style=3D"width:100%;font-family:Arial,Sans-serif;bor=
der:1px Solid #ccc;border-width:1px 2px 2px 1px;background-color:#fff;"><tr=
><td><meta itemprop=3D"eventStatus" content=3D"http://schema.org/EventSched=
uled"/><h4 style=3D"padding:6px 0;margin:0 0 4px 0;font-family:Arial,Sans-s=
erif;font-size:13px;line-height:1.4;border:1px Solid #fff;background:#fff;c=
olor:#090;font-weight:normal"><strong>You have been invited to the followin=
g event.</strong></h4><div style=3D"padding:2px"><span itemprop=3D"publishe=
r" itemscope itemtype=3D"http://schema.org/Organization"><meta itemprop=3D"=
name" content=3D"Google Calendar"/></span><meta itemprop=3D"eventId/googleC=
alendar" content=3D"72pav8a9ib0m49k8qr9hjibgg7"/><h3 style=3D"padding:0 0 6=
px 0;margin:0;font-family:Arial,Sans-serif;font-size:16px;font-weight:bold;=
color:#222"><span itemprop=3D"name">QAPI Sync meeting</span></h3><table sty=
le=3D"display:inline-table" cellpadding=3D"0" cellspacing=3D"0" border=3D"0=
" summary=3D"Event details"><tr><td style=3D"padding:0 1em 10px 0;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px=
" valign=3D"top"><div><i style=3D"font-style:normal">When</i></div></td><td=
 style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222" valign=3D"top"><div style=3D"text-indent:-1px"><time itemprop=3D=
"startDate" datetime=3D"20211007T130000Z"></time><time itemprop=3D"endDate"=
 datetime=3D"20211007T140000Z"></time>Thu Oct 7, 2021 9am =E2=80=93 10am <s=
pan style=3D"color:#888">Eastern Time - New York</span></div></td></tr><tr>=
<td style=3D"padding:0 1em 4px 0;font-family:Arial,Sans-serif;font-size:13p=
x;color:#888;white-space:nowrap;width:90px" valign=3D"top"><div><i style=3D=
"font-style:normal">Joining info</i></div></td><td style=3D"padding-bottom:=
4px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top">=
<div style=3D"text-indent:-1px">Join with Google Meet</div></td></tr><tr><t=
d style=3D"padding:0 1em 10px 0;font-family:Arial,Sans-serif;font-size:13px=
;color:#888;white-space:nowrap;width:90px"></td><td style=3D"padding-bottom=
:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222" valign=3D"top=
"><div style=3D"text-indent:-1px"><div style=3D"text-indent:-1px"><span ite=
mprop=3D"potentialaction" itemscope itemtype=3D"http://schema.org/JoinActio=
n"><span itemprop=3D"name" content=3D"meet.google.com/xqi-tiqs-xrz"><span i=
temprop=3D"target" itemscope itemtype=3D"http://schema.org/EntryPoint"><spa=
n itemprop=3D"url" content=3D"https://meet.google.com/xqi-tiqs-xrz?hs=3D224=
"><span itemprop=3D"httpMethod" content=3D"GET"><a href=3D"https://meet.goo=
gle.com/xqi-tiqs-xrz?hs=3D224" style=3D"color:#20c;white-space:nowrap" targ=
et=3D"_blank">meet.google.com/xqi-tiqs-xrz</a></span></span></span></span><=
/span> </div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90p=
x"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-=
size:13px;color:#222" valign=3D"top"></td></tr><td style=3D"padding:0 1em 4=
px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:now=
rap;width:90px"></td><td style=3D"padding-bottom:4px;font-family:Arial,Sans=
-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:=
-1px">Join by phone</div></td><tr><td style=3D"padding:0 1em 10px 0;font-fa=
mily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90=
px"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font=
-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px"><div =
style=3D"text-indent:-1px"><span style=3D"color:#888">(US) </span><a href=
=3D"tel:+1-929-249-4854;637379240#" style=3D"color:#20c;white-space:nowrap"=
 target=3D"_blank">+1 929-249-4854</a> <span style=3D"color:#888">(PIN: 637=
379240)</span></div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;wi=
dth:90px"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-seri=
f;font-size:13px;color:#222" valign=3D"top"></td></tr><td style=3D"padding:=
0 1em 4px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-sp=
ace:nowrap;width:90px"></td><td style=3D"padding-bottom:4px;font-family:Ari=
al,Sans-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-=
indent:-1px">Join using SIP</div></td><tr><td style=3D"padding:0 1em 10px 0=
;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;=
width:90px"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-se=
rif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-indent:-1p=
x"><div style=3D"text-indent:-1px"><a href=3D"sip:6779067023105@gmeet.redha=
t.com" style=3D"color:#20c;white-space:nowrap" target=3D"_blank">6779067023=
105@gmeet.redhat.com</a> <span style=3D"color:#888">(ID: 6779067023105)</sp=
an></div></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:=
Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px"><=
/td><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size=
:13px;color:#222" valign=3D"top"></td></tr><tr><td style=3D"padding:0 1em 1=
0px 0;font-family:Arial,Sans-serif;font-size:13px;color:#888;white-space:no=
wrap;width:90px"></td><td style=3D"padding-bottom:10px;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#222" valign=3D"top"><div style=3D"text-inden=
t:-1px"><a href=3D"https://tel.meet/xqi-tiqs-xrz?pin=3D6779067023105&amp;hs=
=3D0" style=3D"color:#20c;white-space:nowrap" target=3D"_blank">More joinin=
g options</a></div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-fam=
ily:Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90p=
x" valign=3D"top"><div><i style=3D"font-style:normal">Calendar</i></div></t=
d><td style=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:1=
3px;color:#222" valign=3D"top"><div style=3D"text-indent:-1px">qemu-devel@n=
ongnu.org</div></td></tr><tr><td style=3D"padding:0 1em 10px 0;font-family:=
Arial,Sans-serif;font-size:13px;color:#888;white-space:nowrap;width:90px" v=
align=3D"top"><div><i style=3D"font-style:normal">Who</i></div></td><td sty=
le=3D"padding-bottom:10px;font-family:Arial,Sans-serif;font-size:13px;color=
:#222" valign=3D"top"><table cellspacing=3D"0" cellpadding=3D"0"><tr><td st=
yle=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color=
:#222;width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-famil=
y:Courier New,monospace">&#x2022;</span></div></td><td style=3D"padding-rig=
ht:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=
=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=
=3D"attendee" itemscope itemtype=3D"http://schema.org/Person"><span itempro=
p=3D"name" class=3D"notranslate">jsnow@redhat.com</span><meta itemprop=3D"e=
mail" content=3D"jsnow@redhat.com"/></span><span itemprop=3D"organizer" ite=
mscope itemtype=3D"http://schema.org/Person"><meta itemprop=3D"name" conten=
t=3D"jsnow@redhat.com"/><meta itemprop=3D"email" content=3D"jsnow@redhat.co=
m"/></span><span style=3D"font-size:11px;color:#888"> - organizer</span></d=
iv></div></div></td></tr><tr><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=3D"text-ind=
ent:-1px"><span style=3D"font-family:Courier New,monospace">&#x2022;</span>=
</div></td><td style=3D"padding-right:10px;font-family:Arial,Sans-serif;fon=
t-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><div style=3D"=
margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http:=
//schema.org/Person"><span itemprop=3D"name" class=3D"notranslate">berrange=
@redhat.com</span><meta itemprop=3D"email" content=3D"berrange@redhat.com"/=
></span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;fon=
t-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div style=
=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#x=
2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,Sa=
ns-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><d=
iv style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope itemt=
ype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransla=
te">pbonzini@redhat.com</span><meta itemprop=3D"email" content=3D"pbonzini@=
redhat.com"/></span></div></div></div></td></tr><tr><td style=3D"padding-ri=
ght:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"=
><div style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,mon=
ospace">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-fami=
ly:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1=
px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" item=
scope itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=
=3D"notranslate">armbru@redhat.com</span><meta itemprop=3D"email" content=
=3D"armbru@redhat.com"/></span></div></div></div></td></tr><tr><td style=3D=
"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;color:#222;=
width:10px"><div style=3D"text-indent:-1px"><span style=3D"font-family:Cour=
ier New,monospace">&#x2022;</span></div></td><td style=3D"padding-right:10p=
x;font-family:Arial,Sans-serif;font-size:13px;color:#222"><div style=3D"tex=
t-indent:-1px"><div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"att=
endee" itemscope itemtype=3D"http://schema.org/Person"><span itemprop=3D"na=
me" class=3D"notranslate">damien.hedde@greensocs.com</span><meta itemprop=
=3D"email" content=3D"damien.hedde@greensocs.com"/></span></div></div></div=
></td></tr><tr><td style=3D"padding-right:10px;font-family:Arial,Sans-serif=
;font-size:13px;color:#222;width:10px"><div style=3D"text-indent:-1px"><spa=
n style=3D"font-family:Courier New,monospace">&#x2022;</span></div></td><td=
 style=3D"padding-right:10px;font-family:Arial,Sans-serif;font-size:13px;co=
lor:#222"><div style=3D"text-indent:-1px"><div><div style=3D"margin:0 0 0.3=
em 0"><span itemprop=3D"attendee" itemscope itemtype=3D"http://schema.org/P=
erson"><span itemprop=3D"name" class=3D"notranslate">marcandre.lureau@redha=
t.com</span><meta itemprop=3D"email" content=3D"marcandre.lureau@redhat.com=
"/></span></div></div></div></td></tr><tr><td style=3D"padding-right:10px;f=
ont-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div styl=
e=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospace">&#=
x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Arial,S=
ans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><div><=
div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope item=
type=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"notransl=
ate">kwolf@redhat.com</span><meta itemprop=3D"email" content=3D"kwolf@redha=
t.com"/></span></div></div></div></td></tr><tr><td style=3D"padding-right:1=
0px;font-family:Arial,Sans-serif;font-size:13px;color:#222;width:10px"><div=
 style=3D"text-indent:-1px"><span style=3D"font-family:Courier New,monospac=
e">&#x2022;</span></div></td><td style=3D"padding-right:10px;font-family:Ar=
ial,Sans-serif;font-size:13px;color:#222"><div style=3D"text-indent:-1px"><=
div><div style=3D"margin:0 0 0.3em 0"><span itemprop=3D"attendee" itemscope=
 itemtype=3D"http://schema.org/Person"><span itemprop=3D"name" class=3D"not=
ranslate">qemu-devel@nongnu.org</span><meta itemprop=3D"email" content=3D"q=
emu-devel@nongnu.org"/></span></div></div></div></td></tr></table></td></tr=
></table><div style=3D"float:right;font-weight:bold;font-size:13px"> <a hre=
f=3D"https://calendar.google.com/calendar/event?action=3DVIEW&amp;eid=3DNzJ=
wYXY4YTlpYjBtNDlrOHFyOWhqaWJnZzcgcWVtdS1kZXZlbEBub25nbnUub3Jn&amp;tok=3DMTY=
janNub3dAcmVkaGF0LmNvbTAxYTNkNTk0NTQyOWNkNDk4YzgxYTY1ZDdhMTc3ODM3NzAyOTg0Mz=
M&amp;ctz=3DAmerica%2FNew_York&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;=
white-space:nowrap" itemprop=3D"url">more details &raquo;</a><br></div><div=
 style=3D"padding-bottom:15px;font-family:Arial,Sans-serif;font-size:13px;c=
olor:#222;white-space:pre-wrap!important;white-space:-moz-pre-wrap!importan=
t;white-space:-pre-wrap!important;white-space:-o-pre-wrap!important;white-s=
pace:pre;word-wrap:break-word"><span>Let&#39;s discuss our ongoing and futu=
re work on the QAPI generator and closely related interfaces for QEMU.<p>Pl=
ease prepare for the meeting by writing a small overview of your pending an=
d future work, and the goals that motivate those works. If you send this su=
mmary to the mailing list beforehand, we&#39;ll have the opportunity to ski=
m it prior to the meeting.</p><p>I am suggesting we use a public etherpad i=
nstance to keep notes during the meeting: <a href=3D"https://www.google.com=
/url?q=3Dhttps%3A%2F%2Fetherpad.wikimedia.org%2Fp%2Fqapi-sync&amp;sa=3DD&am=
p;ust=3D1633813306801000&amp;usg=3DAOvVaw2HpiQ7_lM8xUA6hYR3Uqcy" target=3D"=
_blank">https://etherpad.wikimedia.org/p/qapi-sync</a></p><p>During this me=
eting, I&#39;d like to assemble a list of all ongoing QAPI work and begin w=
ork on crafting a roadmap that helps describe that work.</p><p>I don&#39;t =
suspect we&#39;ll finish in a single meeting, but it may be a helpful prime=
r for follow-up discussions on the ML.</p></span><meta itemprop=3D"descript=
ion" content=3D"Let&#39;s discuss our ongoing and future work on the QAPI g=
enerator and closely related interfaces for QEMU.

Please prepare for the meeting by writing a small overview of your pending =
and future work, and the goals that motivate those works. If you send this =
summary to the mailing list beforehand, we&#39;ll have the opportunity to s=
kim it prior to the meeting.

I am suggesting we use a public etherpad instance to keep notes during the =
meeting: https://etherpad.wikimedia.org/p/qapi-sync

During this meeting, I&#39;d like to assemble a list of all ongoing QAPI wo=
rk and begin work on crafting a roadmap that helps describe that work.

I don&#39;t suspect we&#39;ll finish in a single meeting, but it may be a h=
elpful primer for follow-up discussions on the ML."/></div></div><p style=
=3D"color:#222;font-size:13px;margin:0"><span style=3D"color:#888">Going (q=
emu-devel@nongnu.org)?&nbsp;&nbsp;&nbsp;</span><wbr><strong><span itemprop=
=3D"potentialaction" itemscope itemtype=3D"http://schema.org/RsvpAction"><m=
eta itemprop=3D"attendance" content=3D"http://schema.org/RsvpAttendance/Yes=
"/><span itemprop=3D"handler" itemscope itemtype=3D"http://schema.org/HttpA=
ctionHandler"><link itemprop=3D"method" href=3D"http://schema.org/HttpReque=
stMethod/GET"/><a href=3D"https://calendar.google.com/calendar/event?action=
=3DRESPOND&amp;eid=3DNzJwYXY4YTlpYjBtNDlrOHFyOWhqaWJnZzcgcWVtdS1kZXZlbEBub2=
5nbnUub3Jn&amp;rst=3D1&amp;tok=3DMTYjanNub3dAcmVkaGF0LmNvbTAxYTNkNTk0NTQyOW=
NkNDk4YzgxYTY1ZDdhMTc3ODM3NzAyOTg0MzM&amp;ctz=3DAmerica%2FNew_York&amp;hl=
=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">=
Yes</a></span></span><span style=3D"margin:0 0.4em;font-weight:normal"> - <=
/span><span itemprop=3D"potentialaction" itemscope itemtype=3D"http://schem=
a.org/RsvpAction"><meta itemprop=3D"attendance" content=3D"http://schema.or=
g/RsvpAttendance/Maybe"/><span itemprop=3D"handler" itemscope itemtype=3D"h=
ttp://schema.org/HttpActionHandler"><link itemprop=3D"method" href=3D"http:=
//schema.org/HttpRequestMethod/GET"/><a href=3D"https://calendar.google.com=
/calendar/event?action=3DRESPOND&amp;eid=3DNzJwYXY4YTlpYjBtNDlrOHFyOWhqaWJn=
ZzcgcWVtdS1kZXZlbEBub25nbnUub3Jn&amp;rst=3D3&amp;tok=3DMTYjanNub3dAcmVkaGF0=
LmNvbTAxYTNkNTk0NTQyOWNkNDk4YzgxYTY1ZDdhMTc3ODM3NzAyOTg0MzM&amp;ctz=3DAmeri=
ca%2FNew_York&amp;hl=3Den&amp;es=3D0" style=3D"color:#20c;white-space:nowra=
p" itemprop=3D"url">Maybe</a></span></span><span style=3D"margin:0 0.4em;fo=
nt-weight:normal"> - </span><span itemprop=3D"potentialaction" itemscope it=
emtype=3D"http://schema.org/RsvpAction"><meta itemprop=3D"attendance" conte=
nt=3D"http://schema.org/RsvpAttendance/No"/><span itemprop=3D"handler" item=
scope itemtype=3D"http://schema.org/HttpActionHandler"><link itemprop=3D"me=
thod" href=3D"http://schema.org/HttpRequestMethod/GET"/><a href=3D"https://=
calendar.google.com/calendar/event?action=3DRESPOND&amp;eid=3DNzJwYXY4YTlpY=
jBtNDlrOHFyOWhqaWJnZzcgcWVtdS1kZXZlbEBub25nbnUub3Jn&amp;rst=3D2&amp;tok=3DM=
TYjanNub3dAcmVkaGF0LmNvbTAxYTNkNTk0NTQyOWNkNDk4YzgxYTY1ZDdhMTc3ODM3NzAyOTg0=
MzM&amp;ctz=3DAmerica%2FNew_York&amp;hl=3Den&amp;es=3D0" style=3D"color:#20=
c;white-space:nowrap" itemprop=3D"url">No</a></span></span></strong>&nbsp;&=
nbsp;&nbsp;&nbsp;<wbr><a href=3D"https://calendar.google.com/calendar/event=
?action=3DVIEW&amp;eid=3DNzJwYXY4YTlpYjBtNDlrOHFyOWhqaWJnZzcgcWVtdS1kZXZlbE=
Bub25nbnUub3Jn&amp;tok=3DMTYjanNub3dAcmVkaGF0LmNvbTAxYTNkNTk0NTQyOWNkNDk4Yz=
gxYTY1ZDdhMTc3ODM3NzAyOTg0MzM&amp;ctz=3DAmerica%2FNew_York&amp;hl=3Den&amp;=
es=3D0" style=3D"color:#20c;white-space:nowrap" itemprop=3D"url">more optio=
ns &raquo;</a></p></td></tr><tr><td style=3D"background-color:#f6f6f6;color=
:#888;border-top:1px Solid #ccc;font-family:Arial,Sans-serif;font-size:11px=
"><p>Invitation from <a href=3D"https://calendar.google.com/calendar/" targ=
et=3D"_blank" style=3D"">Google Calendar</a></p><p>You are receiving this c=
ourtesy email at the account qemu-devel@nongnu.org because you are an atten=
dee of this event.</p><p>To stop receiving future updates for this event, d=
ecline this event. Alternatively you can sign up for a Google account at ht=
tps://calendar.google.com/calendar/ and control your notification settings =
for your entire calendar.</p><p>Forwarding this invitation could allow any =
recipient to send a response to the organizer and be added to the guest lis=
t, or invite others regardless of their own invitation status, or to modify=
 your RSVP. <a href=3D"https://support.google.com/calendar/answer/37135#for=
warding">Learn More</a>.</p></td></tr></table></div></span></span>
--00000000000093850a05cd8d38f3
Content-Type: text/calendar; charset="UTF-8"; method=REQUEST
Content-Transfer-Encoding: 7bit

BEGIN:VCALENDAR
PRODID:-//Google Inc//Google Calendar 70.9054//EN
VERSION:2.0
CALSCALE:GREGORIAN
METHOD:REQUEST
BEGIN:VEVENT
DTSTART:20211007T130000Z
DTEND:20211007T140000Z
DTSTAMP:20211004T210146Z
ORGANIZER;CN=jsnow@redhat.com:mailto:jsnow@redhat.com
UID:72pav8a9ib0m49k8qr9hjibgg7@google.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=berrange@redhat.com;X-NUM-GUESTS=0:mailto:berrange@redhat.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=jsnow@redhat.com;X-NUM-GUESTS=0:mailto:jsnow@redhat.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=pbonzini@redhat.com;X-NUM-GUESTS=0:mailto:pbonzini@redhat.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=armbru@redhat.com;X-NUM-GUESTS=0:mailto:armbru@redhat.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=damien.hedde@greensocs.com;X-NUM-GUESTS=0:mailto:damien.hedde@greensocs
 .com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=ACCEPTED;RSVP=TRUE
 ;CN=marcandre.lureau@redhat.com;X-NUM-GUESTS=0:mailto:marcandre.lureau@redh
 at.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=kwolf@redhat.com;X-NUM-GUESTS=0:mailto:kwolf@redhat.com
ATTENDEE;CUTYPE=INDIVIDUAL;ROLE=REQ-PARTICIPANT;PARTSTAT=NEEDS-ACTION;RSVP=
 TRUE;CN=qemu-devel@nongnu.org;X-NUM-GUESTS=0:mailto:qemu-devel@nongnu.org
X-MICROSOFT-CDO-OWNERAPPTID:-2106639245
CREATED:20211001T001809Z
DESCRIPTION:Let's discuss our ongoing and future work on the QAPI generator
  and closely related interfaces for QEMU.\n\nPlease prepare for the meeting
  by writing a small overview of your pending and future work\, and the goal
 s that motivate those works. If you send this summary to the mailing list b
 eforehand\, we'll have the opportunity to skim it prior to the meeting.\n\n
 I am suggesting we use a public etherpad instance to keep notes during the 
 meeting: https://etherpad.wikimedia.org/p/qapi-sync\n\nDuring this meeting\
 , I'd like to assemble a list of all ongoing QAPI work and begin work on cr
 afting a roadmap that helps describe that work.\n\nI don't suspect we'll fi
 nish in a single meeting\, but it may be a helpful primer for follow-up dis
 cussions on the ML.\n\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~:~:~:~:~:~::~:~::-\nDo not edit this section of the descri
 ption.\n\nThis event has a video call.\nJoin: https://meet.google.com/xqi-t
 iqs-xrz\n(US) +1 929-249-4854 PIN: 637379240#\n\nJoin using SIP\n6779067023
 105@gmeet.redhat.com (ID: 6779067023105)\nView more joining options: https:
 //tel.meet/xqi-tiqs-xrz?pin=6779067023105&hs=7\n\nView your event at https:
 //calendar.google.com/calendar/event?action=VIEW&eid=NzJwYXY4YTlpYjBtNDlrOH
 FyOWhqaWJnZzcgcWVtdS1kZXZlbEBub25nbnUub3Jn&tok=MTYjanNub3dAcmVkaGF0LmNvbTAx
 YTNkNTk0NTQyOWNkNDk4YzgxYTY1ZDdhMTc3ODM3NzAyOTg0MzM&ctz=America%2FNew_York&
 hl=en&es=1.\n-::~:~::~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:~:
 ~:~:~:~:~:~:~:~:~::~:~::-
LAST-MODIFIED:20211004T210146Z
LOCATION:
SEQUENCE:0
STATUS:CONFIRMED
SUMMARY:QAPI Sync meeting
TRANSP:OPAQUE
END:VEVENT
END:VCALENDAR

--00000000000093850a05cd8d38f3--

--00000000000093850d05cd8d38f5
Content-Type: application/ics; name="invite.ics"
Content-Disposition: attachment; filename="invite.ics"
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpQUk9ESUQ6LS8vR29vZ2xlIEluYy8vR29vZ2xlIENhbGVuZGFyIDcw
LjkwNTQvL0VODQpWRVJTSU9OOjIuMA0KQ0FMU0NBTEU6R1JFR09SSUFODQpNRVRIT0Q6UkVRVUVT
VA0KQkVHSU46VkVWRU5UDQpEVFNUQVJUOjIwMjExMDA3VDEzMDAwMFoNCkRURU5EOjIwMjExMDA3
VDE0MDAwMFoNCkRUU1RBTVA6MjAyMTEwMDRUMjEwMTQ2Wg0KT1JHQU5JWkVSO0NOPWpzbm93QHJl
ZGhhdC5jb206bWFpbHRvOmpzbm93QHJlZGhhdC5jb20NClVJRDo3MnBhdjhhOWliMG00OWs4cXI5
aGppYmdnN0Bnb29nbGUuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPWJlcnJhbmdl
QHJlZGhhdC5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmJlcnJhbmdlQHJlZGhhdC5jb20NCkFU
VEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPUFD
Q0VQVEVEO1JTVlA9VFJVRQ0KIDtDTj1qc25vd0ByZWRoYXQuY29tO1gtTlVNLUdVRVNUUz0wOm1h
aWx0bzpqc25vd0ByZWRoYXQuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJF
US1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD0NCiBUUlVFO0NOPXBib256
aW5pQHJlZGhhdC5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOnBib256aW5pQHJlZGhhdC5jb20N
CkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFU
PU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049YXJtYnJ1QHJlZGhhdC5jb207WC1OVU0tR1VF
U1RTPTA6bWFpbHRvOmFybWJydUByZWRoYXQuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVB
TDtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049
ZGFtaWVuLmhlZGRlQGdyZWVuc29jcy5jb207WC1OVU0tR1VFU1RTPTA6bWFpbHRvOmRhbWllbi5o
ZWRkZUBncmVlbnNvY3MNCiAuY29tDQpBVFRFTkRFRTtDVVRZUEU9SU5ESVZJRFVBTDtST0xFPVJF
US1QQVJUSUNJUEFOVDtQQVJUU1RBVD1BQ0NFUFRFRDtSU1ZQPVRSVUUNCiA7Q049bWFyY2FuZHJl
Lmx1cmVhdUByZWRoYXQuY29tO1gtTlVNLUdVRVNUUz0wOm1haWx0bzptYXJjYW5kcmUubHVyZWF1
QHJlZGgNCiBhdC5jb20NCkFUVEVOREVFO0NVVFlQRT1JTkRJVklEVUFMO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPQ0KIFRSVUU7Q049a3dvbGZAcmVkaGF0
LmNvbTtYLU5VTS1HVUVTVFM9MDptYWlsdG86a3dvbGZAcmVkaGF0LmNvbQ0KQVRURU5ERUU7Q1VU
WVBFPUlORElWSURVQUw7Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9O
O1JTVlA9DQogVFJVRTtDTj1xZW11LWRldmVsQG5vbmdudS5vcmc7WC1OVU0tR1VFU1RTPTA6bWFp
bHRvOnFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOi0y
MTA2NjM5MjQ1DQpDUkVBVEVEOjIwMjExMDAxVDAwMTgwOVoNCkRFU0NSSVBUSU9OOkxldCdzIGRp
c2N1c3Mgb3VyIG9uZ29pbmcgYW5kIGZ1dHVyZSB3b3JrIG9uIHRoZSBRQVBJIGdlbmVyYXRvcg0K
ICBhbmQgY2xvc2VseSByZWxhdGVkIGludGVyZmFjZXMgZm9yIFFFTVUuXG5cblBsZWFzZSBwcmVw
YXJlIGZvciB0aGUgbWVldGluZw0KICBieSB3cml0aW5nIGEgc21hbGwgb3ZlcnZpZXcgb2YgeW91
ciBwZW5kaW5nIGFuZCBmdXR1cmUgd29ya1wsIGFuZCB0aGUgZ29hbA0KIHMgdGhhdCBtb3RpdmF0
ZSB0aG9zZSB3b3Jrcy4gSWYgeW91IHNlbmQgdGhpcyBzdW1tYXJ5IHRvIHRoZSBtYWlsaW5nIGxp
c3QgYg0KIGVmb3JlaGFuZFwsIHdlJ2xsIGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIHNraW0gaXQg
cHJpb3IgdG8gdGhlIG1lZXRpbmcuXG5cbg0KIEkgYW0gc3VnZ2VzdGluZyB3ZSB1c2UgYSBwdWJs
aWMgZXRoZXJwYWQgaW5zdGFuY2UgdG8ga2VlcCBub3RlcyBkdXJpbmcgdGhlIA0KIG1lZXRpbmc6
IGh0dHBzOi8vZXRoZXJwYWQud2lraW1lZGlhLm9yZy9wL3FhcGktc3luY1xuXG5EdXJpbmcgdGhp
cyBtZWV0aW5nXA0KICwgSSdkIGxpa2UgdG8gYXNzZW1ibGUgYSBsaXN0IG9mIGFsbCBvbmdvaW5n
IFFBUEkgd29yayBhbmQgYmVnaW4gd29yayBvbiBjcg0KIGFmdGluZyBhIHJvYWRtYXAgdGhhdCBo
ZWxwcyBkZXNjcmliZSB0aGF0IHdvcmsuXG5cbkkgZG9uJ3Qgc3VzcGVjdCB3ZSdsbCBmaQ0KIG5p
c2ggaW4gYSBzaW5nbGUgbWVldGluZ1wsIGJ1dCBpdCBtYXkgYmUgYSBoZWxwZnVsIHByaW1lciBm
b3IgZm9sbG93LXVwIGRpcw0KIGN1c3Npb25zIG9uIHRoZSBNTC5cblxuLTo6fjp+Ojp+On46fjp+
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Og0KIH46fjp+On46fjp+On46fjp+
On46fjp+On46fjo6fjp+OjotXG5EbyBub3QgZWRpdCB0aGlzIHNlY3Rpb24gb2YgdGhlIGRlc2Ny
aQ0KIHB0aW9uLlxuXG5UaGlzIGV2ZW50IGhhcyBhIHZpZGVvIGNhbGwuXG5Kb2luOiBodHRwczov
L21lZXQuZ29vZ2xlLmNvbS94cWktdA0KIGlxcy14cnpcbihVUykgKzEgOTI5LTI0OS00ODU0IFBJ
TjogNjM3Mzc5MjQwI1xuXG5Kb2luIHVzaW5nIFNJUFxuNjc3OTA2NzAyMw0KIDEwNUBnbWVldC5y
ZWRoYXQuY29tIChJRDogNjc3OTA2NzAyMzEwNSlcblZpZXcgbW9yZSBqb2luaW5nIG9wdGlvbnM6
IGh0dHBzOg0KIC8vdGVsLm1lZXQveHFpLXRpcXMteHJ6P3Bpbj02Nzc5MDY3MDIzMTA1JmhzPTdc
blxuVmlldyB5b3VyIGV2ZW50IGF0IGh0dHBzOg0KIC8vY2FsZW5kYXIuZ29vZ2xlLmNvbS9jYWxl
bmRhci9ldmVudD9hY3Rpb249VklFVyZlaWQ9TnpKd1lYWTRZVGxwWWpCdE5EbHJPSA0KIEZ5T1do
cWFXSm5aemNnY1dWdGRTMWtaWFpsYkVCdWIyNW5iblV1YjNKbiZ0b2s9TVRZamFuTnViM2RBY21W
a2FHRjBMbU52YlRBeA0KIFlUTmtOVGswTlRReU9XTmtORGs0WXpneFlUWTFaRGRoTVRjM09ETTNO
ekF5T1RnME16TSZjdHo9QW1lcmljYSUyRk5ld19Zb3JrJg0KIGhsPWVuJmVzPTEuXG4tOjp+On46
On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+On46fjp+Og0K
IH46fjp+On46fjp+On46fjp+Ojp+On46Oi0NCkxBU1QtTU9ESUZJRUQ6MjAyMTEwMDRUMjEwMTQ2
Wg0KTE9DQVRJT046DQpTRVFVRU5DRTowDQpTVEFUVVM6Q09ORklSTUVEDQpTVU1NQVJZOlFBUEkg
U3luYyBtZWV0aW5nDQpUUkFOU1A6T1BBUVVFDQpFTkQ6VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=

--00000000000093850d05cd8d38f5--


