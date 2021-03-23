Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2BB34568D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 05:05:36 +0100 (CET)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOYIQ-00089j-SX
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 00:05:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lOYH7-0007id-QW
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:04:14 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:39535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gengdongjiu1@gmail.com>)
 id 1lOYH6-0001cJ-8B
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 00:04:13 -0400
Received: by mail-pg1-x541.google.com with SMTP id k24so10395228pgl.6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 21:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=4i5686Y4FHNDkriGSqRWOIvNlFydoGwhwYRYzPTrNgM=;
 b=R7n5mPVEr7c147VlNVesVAVQ6kI/isWNLsFuz7ekAeRy0Pcq/DTgBeyJYQeptBbtbM
 26gCl0J/Fepzm0EHjj8CyEAp+blVsVgGJkNUavEhhUkIjcugJXkAjB33NCgJrxxsPZa7
 V/TPoR9Vm7nKqU6BRmSGYsnIWXErK42GFLcm3n5KnNvglDN9o7NgABSuTHdkbun/FaOX
 XtfE3ryrnphmLUsv8Y+oMsyRuyIlq9sbqWO2c9Oh633m7qbWOsP4VHCcX71JznGYv3P4
 geWduTft+r0tv7oYerGUj3hUd7CHDAIfvocmS0GFi4DdXKYwCNbyTxuKdvq2p/zpoZbY
 egsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=4i5686Y4FHNDkriGSqRWOIvNlFydoGwhwYRYzPTrNgM=;
 b=VbHkfZ4eaUDn2BTy8du2AvpEwRReEltRbtriHiFv4eP33VBCLQPlHqWzWFGl/fV4Y7
 d0Fd0jsiztYk3DTQKh3NrfzaEfnJtmpTCoSmTBRItvNWGN+o6yD3ifqH4ZrvJyvz+Z12
 jxiedkv6/mjoBA9Lda/Kdk5MFAr80Ihi6XRYZisP3YssaqwYoLW4lXGs/bhhT/WXTnKF
 mx9qcV1N827KpMUoRETEEv9WBJmfnXqlZC7hOehIkwWEy3E8NpxhBN/a+vmVYXDtxfal
 f3r/iYtFX7bBvCYr4fbS7huN/Dph79IUJLob4X5OYauAjsI3gimH89oHzdPVIWgp84ub
 ePwg==
X-Gm-Message-State: AOAM531++sgJuiCKPQ52ONTOu74967QXI8DmVohHcyUkvL3AJVIvYWKx
 8mOetMRI+OqKSkRzFLb6zXM=
X-Google-Smtp-Source: ABdhPJz4hKNOvsu2q/C286AMSnJKH7gnyAE2etQcAH8u3B21w9s4F4ZSLwt/zg64SEWAh8Y7rr7JQg==
X-Received: by 2002:a17:902:ead2:b029:e5:ba7a:a232 with SMTP id
 p18-20020a170902ead2b02900e5ba7aa232mr3036396pld.19.1616472248943; 
 Mon, 22 Mar 2021 21:04:08 -0700 (PDT)
Received: from PC-20160529VBAK ([103.129.252.48])
 by smtp.gmail.com with ESMTPSA id 202sm14782424pfu.46.2021.03.22.21.04.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 21:04:08 -0700 (PDT)
Date: Tue, 23 Mar 2021 12:04:05 +0800
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: =?utf-8?Q?mst=40redhat.com?= <mst@redhat.com>, 
 =?utf-8?Q?peter.maydell=40linaro.org?= <peter.maydell@linaro.org>, 
 =?utf-8?Q?qemu-devel=40nongnu.org?= <qemu-devel@nongnu.org>
Message-ID: <F8970EB7-4D0F-43B1-AACD-B161F505C6EC@gmail.com>
In-Reply-To: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
References: <1615462144-10864-1-git-send-email-gengdongjiu1@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: replace Huawei's email to personal one
X-Mailer: MailMasterPC/4.15.6.1012 (Windows 7)
X-CUSTOM-MAIL-MASTER-SENT-ID: F2FC5C79-1049-4E49-84DC-7E0E9FEE3978
MIME-Version: 1.0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64
Received-SPF: pass client-ip=2607:f8b0:4864:20::541;
 envelope-from=gengdongjiu1@gmail.com; helo=mail-pg1-x541.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 MIME_HTML_ONLY=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "=?utf-8?Q?gengdongjiu1=40gmail.com?=" <gengdongjiu1@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PGh0bWw+DQo8aGVhZD4NCiAgICA8bWV0YSBodHRwLWVxdWl2PSdDb250ZW50LVR5cGUnIGNvbnRl
bnQ9J3RleHQvaHRtbDsgY2hhcnNldD1VVEYtOCc+DQo8L2hlYWQ+DQo8Ym9keT4NCjxzdHlsZT4N
CiAgICBmb250ew0KICAgICAgICBsaW5lLWhlaWdodDogMS42Ow0KICAgIH0NCiAgICB1bCxvbHsN
CiAgICAgICAgcGFkZGluZy1sZWZ0OiAyMHB4Ow0KICAgICAgICBsaXN0LXN0eWxlLXBvc2l0aW9u
OiBpbnNpZGU7DQogICAgfQ0KPC9zdHlsZT4NCjxkaXYgc3R5bGUgPSAnZm9udC1mYW1pbHk65b6u
6L2v6ZuF6buRLFZlcmRhbmEsJnF1b3Q7TWljcm9zb2Z0IFlhaGVpJnF1b3Q7LFNpbVN1bixzYW5z
LXNlcmlmO2ZvbnQtc2l6ZToxNHB4OyBsaW5lLWhlaWdodDoxLjY7Jz4NCiAgICA8ZGl2ID48ZGl2
PgogICAgPGRpdj5waW5nLi4uPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5zb3JyeSBmb3IgdGhl
IG5vaXNlLjwvZGl2PjxkaXY+CiAgICA8L2Rpdj4KICAgIDxkaXYgaWQ9Im50ZXMtcGNtYWMtc2ln
bmF0dXJlIiBzdHlsZT0iZm9udC1mYW1pbHk6J+W+rui9r+mbhem7kSciPgogICAgICAgIAogICAg
ICAgIDxkaXYgc3R5bGU9ImZvbnQtc2l6ZToxNHB4OyBwYWRkaW5nOiAwOyAgbWFyZ2luOjA7Ij4K
CiAgICAgICAgPC9kaXY+CiAgICA8L2Rpdj4KPC9kaXY+PC9kaXY+PGRpdiBjbGFzcz0iSi1yZXBs
eSIgc3R5bGU9ImJhY2tncm91bmQtY29sb3I6I2YyZjJmMjtjb2xvcjpibGFjaztwYWRkaW5nLXRv
cDo2cHg7cGFkZGluZy1ib3R0b206NnB4O2JvcmRlci1yYWRpdXM6M3B4Oy1tb3otYm9yZGVyLXJh
ZGl1czozcHg7LXdlYmtpdC1ib3JkZXItcmFkaXVzOjNweDttYXJnaW4tdG9wOjQ1cHg7bWFyZ2lu
LWJvdHRvbToyMHB4O2ZvbnQtZmFtaWx5Oiflvq7ova/pm4Xpu5EnOyI+CiAgICA8ZGl2IHN0eWxl
PSJmb250LXNpemU6MTJweDtsaW5lLWhlaWdodDoxLjU7d29yZC1icmVhazpicmVhay1hbGw7bWFy
Z2luLWxlZnQ6MTBweDttYXJnaW4tcmlnaHQ6MTBweCI+T24gPHNwYW4gY2xhc3M9Im1haWwtZGF0
ZSI+My8xMS8yMDIxIDE5OjI5PC9zcGFuPu+8jDxhIGNsYXNzPSJtYWlsLXRvIiBzdHlsZT0idGV4
dC1kZWNvcmF0aW9uOm5vbmU7Y29sb3I6IzJhODNmMjsiIGhyZWY9Im1haWx0bzpnZW5nZG9uZ2pp
dTFAZ21haWwuY29tIj5Eb25naml1IEdlbmcmbHQ7Z2VuZ2RvbmdqaXUxQGdtYWlsLmNvbSZndDs8
L2E+IHdyb3Rl77yaIDwvZGl2Pgo8L2Rpdj4KPGJsb2NrcXVvdGUgaWQ9Im50ZXMtcGNtYWlsLXF1
b3RlIiBzdHlsZT0ibWFyZ2luOiAwOyBwYWRkaW5nOiAwOyBmb250LXNpemU6IDE0cHg7IGZvbnQt
ZmFtaWx5OiAn5b6u6L2v6ZuF6buRJzsiPgpJbiBvcmRlciB0byBjb252ZW5pZW50bHkgcmVjZWl2
ZSBlbWFpbCwgcmVwbGFjZSB0aGUgSHVhd2VpPGJyPmVtYWlsIGFkZHJlc3Mgd2l0aCBteSBwZXJz
b25hbCBvbmUuPGJyPjxicj5TaWduZWQtb2ZmLWJ5OiBEb25naml1IEdlbmcgJmx0O2dlbmdkb25n
aml1MUBnbWFpbC5jb20mZ3Q7PGJyPi0tLTxicj4gTUFJTlRBSU5FUlMgfCAyICstPGJyPiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSk8YnI+PGJyPmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTPGJyPmluZGV4IGUwNGFlMjEuLjgyM2I5OGIg
MTAwNjQ0PGJyPi0tLSBhL01BSU5UQUlORVJTPGJyPisrKyBiL01BSU5UQUlORVJTPGJyPkBAIC0x
NzExLDcgKzE3MTEsNyBAQCBGOiB0ZXN0cy9xdGVzdC9hY3BpLXV0aWxzLltoY108YnI+IEY6IHRl
c3RzL2RhdGEvYWNwaS88YnI+IDxicj4gQUNQSS9IRVNUL0dIRVM8YnI+LVI6IERvbmdqaXUgR2Vu
ZyAmbHQ7Z2VuZ2RvbmdqaXVAaHVhd2VpLmNvbSZndDs8YnI+K1I6IERvbmdqaXUgR2VuZyAmbHQ7
Z2VuZ2RvbmdqaXUxQGdtYWlsLmNvbSZndDs8YnI+IFI6IFhpYW5nIFpoZW5nICZsdDt6aGVuZ3hp
YW5nOUBodWF3ZWkuY29tJmd0Ozxicj4gTDogcWVtdS1hcm1Abm9uZ251Lm9yZzxicj4gUzogTWFp
bnRhaW5lZDxicj4tLSA8YnI+Mi43LjQ8YnI+PGJyPjwvYmxvY2txdW90ZT48IS0t8J+YgC0tPg0K
PC9kaXY+DQo8L2JvZHk+DQo8L2h0bWw+


