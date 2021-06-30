Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6F93B84A6
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:05:16 +0200 (CEST)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyaq3-0007Zq-80
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:05:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyanr-0006ku-Ma
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:02:59 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:39780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lyanp-0005UX-KP
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:02:59 -0400
Received: by mail-ed1-x532.google.com with SMTP id j11so3422271edq.6
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W1lp+ZB68Q65B0rKzUfdiWUi0TkXUKU7TtDUAmxGEbY=;
 b=UagMoZiPvNvZBemlAKrsNf66cO15HmyULMw8EoAccOpMC7D0RvOTIOCydAxgX15iyJ
 gc3N+zSsAGpuygXu1EF/C0vF731vOn0qnIlry6nB1zeSg5BKvGCT7scmUaveHM4quX2a
 LWXITR+nux9p0TzuCr4jEeDbkUBr8WIDZkzUT+JM5NodvMTfIKgsDFG9JEdxn6gVWm+D
 RdUNYRa92bTf7rprKwj5wCLrhO7nyMtHF5ibCy8M0e/zNcye/S0xKTRHmj6i0+Xs0G51
 ZCZxn8x/wMmoBFR5sd+o5vaPzXlSHnnqtj85NPSWveTa+7fKm+Vs0jiT+BDjjolM2NHn
 IcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W1lp+ZB68Q65B0rKzUfdiWUi0TkXUKU7TtDUAmxGEbY=;
 b=OfJmpXFICorpITBU5101csYoemsc6cATCGMgEaJhjfWWsS6ELmQMlD32a5ANmJJx96
 quoMlAP9apkoWb1CskYFYcQlFTKNIs/k+xCY4tIpBUV8BtVWLN7nSgmlZ1DNKTaIsUvn
 8GXNs6dUYu3mrNhecK/nsZ6zqRQcpZkYYwOyjQLrWyNT95wW+gji2lH4Utp4Spc94J9f
 w9ejAS+zBNLfQnyAPA/7g0ziJYLDEIaSpHEbi6wbFouCytwlRgzwuZe1JAU+xRwSnxXF
 87xmz5Cvs70HJVqERdab+VqBGYKM9OOBo0KCztXa4SkE9nzq02ruwg36/ajk0kEMP7aa
 43IQ==
X-Gm-Message-State: AOAM530anL1O4BTHx2Jmy4uB+x1Js26bndhuKMp9DAowWCKImDP4TP07
 hMx03XMdzeF5/5/EYIX+kBCxfotIj8VY41sBeLw=
X-Google-Smtp-Source: ABdhPJwaIzTHHNs4lVr2HqduVd7byQ7lZ16bOpvVnosNeM3966ConIff636STSb88rUj66luUHpMz93fxvqqNjqFWqY=
X-Received: by 2002:a05:6402:18f6:: with SMTP id
 x54mr48508029edy.53.1625061776179; 
 Wed, 30 Jun 2021 07:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <1625075081-2292-1-git-send-email-wang.yi59@zte.com.cn>
In-Reply-To: <1625075081-2292-1-git-send-email-wang.yi59@zte.com.cn>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 30 Jun 2021 18:02:44 +0400
Message-ID: <CAJ+F1CLt2zZVBW5UXE5HktKuXcyieP4aN5L_nepC=OYy+xDw9Q@mail.gmail.com>
Subject: Re: [PATCH v2] qga: fix a memory leak in qmp_guest_exec_status()
To: Yi Wang <wang.yi59@zte.com.cn>
Content-Type: multipart/alternative; boundary="000000000000e845f205c5fc2d4e"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: wang.liang82@zte.com.cn, Wang Yechao <wang.yechao255@zte.com.cn>,
 QEMU <qemu-devel@nongnu.org>, xue.zhihong@zte.com.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e845f205c5fc2d4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 30, 2021 at 1:55 PM Yi Wang <wang.yi59@zte.com.cn> wrote:

> From: Wang Yechao <wang.yechao255@zte.com.cn>
>
> In some case, $GuestExecInfo.out.length maybe zero and the memory
> is leaked in qmp_guest_exec_status(). Call g_free() on the fileds
> directly to fix memory leak (NULL is ignored).
>
> $GuestExecInfo.err.data has the same problem.
>
> Signed-off-by: Yechao Wang <wang.yechao255@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> Changes in v2:
>  - do not check the size > 0 when call g_free. Thanks to Marc.
> ---
>  qga/commands.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/qga/commands.c b/qga/commands.c
> index d3fec80..26e9358 100644
> --- a/qga/commands.c
> +++ b/qga/commands.c
>
> @@ -214,17 +214,18 @@ GuestExecStatus *qmp_guest_exec_status(int64_t pid,=
 Error **errp)
>          if (gei->out.length > 0) {
>              ges->has_out_data =3D true;
>
>              ges->out_data =3D g_base64_encode(gei->out.data, gei->out.le=
ngth);
> -            g_free(gei->out.data);
>              ges->has_out_truncated =3D gei->out.truncated;
>          }
>
>          if (gei->err.length > 0) {
>              ges->has_err_data =3D true;
>
>              ges->err_data =3D g_base64_encode(gei->err.data, gei->err.le=
ngth);
> -            g_free(gei->err.data);
>              ges->has_err_truncated =3D gei->err.truncated;
>          }
>
> +        g_free(gei->out.data);
> +        g_free(gei->err.data);
> +
>          QTAILQ_REMOVE(&guest_exec_state.processes, gei, next);
>          g_free(gei);
>      }
> --
> 1.8.3.1
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000e845f205c5fc2d4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFdlZCwgSnVu
IDMwLCAyMDIxIGF0IDE6NTUgUE0gWWkgV2FuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOndhbmcueWk1
OUB6dGUuY29tLmNuIj53YW5nLnlpNTlAenRlLmNvbS5jbjwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAw
cHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1s
ZWZ0OjFleCI+RnJvbTrCoFdhbmfCoFllY2hhb8KgJmx0OzxhIGhyZWY9Im1haWx0bzp3YW5nLnll
Y2hhbzI1NUB6dGUuY29tLmNuIiB0YXJnZXQ9Il9ibGFuayI+d2FuZy55ZWNoYW8yNTVAenRlLmNv
bS5jbjwvYT4mZ3Q7DQo8YnI+DQo8YnI+SW7CoHNvbWXCoGNhc2UswqAkR3Vlc3RFeGVjSW5mby5v
dXQubGVuZ3RowqBtYXliZcKgemVyb8KgYW5kwqB0aGXCoG1lbW9yeTxicj5pc8KgbGVha2VkwqBp
bsKgcW1wX2d1ZXN0X2V4ZWNfc3RhdHVzKCkuwqBDYWxswqBnX2ZyZWUoKcKgb27CoHRoZcKgZmls
ZWRzPGJyPmRpcmVjdGx5wqB0b8KgZml4wqBtZW1vcnnCoGxlYWvCoChOVUxMwqBpc8KgaWdub3Jl
ZCkuPGJyPg0KPGJyPiRHdWVzdEV4ZWNJbmZvLmVyci5kYXRhwqBoYXPCoHRoZcKgc2FtZcKgcHJv
YmxlbS48YnI+DQo8YnI+U2lnbmVkLW9mZi1ieTrCoFllY2hhb8KgV2FuZ8KgJmx0OzxhIGhyZWY9
Im1haWx0bzp3YW5nLnllY2hhbzI1NUB6dGUuY29tLmNuIiB0YXJnZXQ9Il9ibGFuayI+d2FuZy55
ZWNoYW8yNTVAenRlLmNvbS5jbjwvYT4mZ3Q7DQo8YnI+U2lnbmVkLW9mZi1ieTrCoFlpwqBXYW5n
wqAmbHQ7PGEgaHJlZj0ibWFpbHRvOndhbmcueWk1OUB6dGUuY29tLmNuIiB0YXJnZXQ9Il9ibGFu
ayI+d2FuZy55aTU5QHp0ZS5jb20uY248L2E+Jmd0Ow0KPGJyPjwvYmxvY2txdW90ZT48ZGl2Pjxi
cj48L2Rpdj48ZGl2PlJldmlld2VkLWJ5OiBNYXJjLUFuZHLDqSBMdXJlYXUgJmx0OzxhIGhyZWY9
Im1haWx0bzptYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20iPm1hcmNhbmRyZS5sdXJlYXVAcmVk
aGF0LmNvbTwvYT4mZ3Q7PC9kaXY+PGRpdj4gPGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCjxicj4tLS08YnI+
Q2hhbmdlc8KgaW7CoHYyOjxicj7CoC3CoGRvwqBub3TCoGNoZWNrwqB0aGXCoHNpemXCoCZndDvC
oDDCoHdoZW7CoGNhbGzCoGdfZnJlZS7CoFRoYW5rc8KgdG/CoE1hcmMuPGJyPi0tLTxicj7CoHFn
YS9jb21tYW5kcy5jwqB8wqA1wqArKystLTxicj7CoDHCoGZpbGXCoGNoYW5nZWQswqAzwqBpbnNl
cnRpb25zKCspLMKgMsKgZGVsZXRpb25zKC0pPGJyPg0KPGJyPmRpZmbCoC0tZ2l0wqBhL3FnYS9j
b21tYW5kcy5jwqBiL3FnYS9jb21tYW5kcy5jPGJyPmluZGV4wqBkM2ZlYzgwLi4yNmU5MzU4wqAx
MDA2NDQ8YnI+LS0twqBhL3FnYS9jb21tYW5kcy5jPGJyPisrK8KgYi9xZ2EvY29tbWFuZHMuYzxi
cj5AQMKgLTIxNCwxN8KgKzIxNCwxOMKgQEDCoEd1ZXN0RXhlY1N0YXR1c8KgKnFtcF9ndWVzdF9l
eGVjX3N0YXR1cyhpbnQ2NF90wqBwaWQswqBFcnJvcsKgKiplcnJwKTxicj7CoMKgwqDCoMKgwqDC
oMKgwqBpZsKgKGdlaS0mZ3Q7b3V0Lmxlbmd0aMKgJmd0O8KgMCnCoHs8YnI+wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBnZXMtJmd0O2hhc19vdXRfZGF0YcKgPcKgdHJ1ZTs8YnI+wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBnZXMtJmd0O291dF9kYXRhwqA9wqBnX2Jhc2U2NF9lbmNvZGUoZ2Vp
LSZndDtvdXQuZGF0YSzCoGdlaS0mZ3Q7b3V0Lmxlbmd0aCk7PGJyPi3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBnX2ZyZWUoZ2VpLSZndDtvdXQuZGF0YSk7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ2VzLSZndDtoYXNfb3V0X3RydW5jYXRlZMKgPcKgZ2VpLSZndDtvdXQudHJ1bmNhdGVk
Ozxicj7CoMKgwqDCoMKgwqDCoMKgwqB9PGJyPsKgDQo8YnI+wqDCoMKgwqDCoMKgwqDCoMKgaWbC
oChnZWktJmd0O2Vyci5sZW5ndGjCoCZndDvCoDApwqB7PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZ2VzLSZndDtoYXNfZXJyX2RhdGHCoD3CoHRydWU7PGJyPsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgZ2VzLSZndDtlcnJfZGF0YcKgPcKgZ19iYXNlNjRfZW5jb2RlKGdlaS0mZ3Q7ZXJy
LmRhdGEswqBnZWktJmd0O2Vyci5sZW5ndGgpOzxicj4twqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Z19mcmVlKGdlaS0mZ3Q7ZXJyLmRhdGEpOzxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdl
cy0mZ3Q7aGFzX2Vycl90cnVuY2F0ZWTCoD3CoGdlaS0mZ3Q7ZXJyLnRydW5jYXRlZDs8YnI+wqDC
oMKgwqDCoMKgwqDCoMKgfTxicj7CoA0KPGJyPivCoMKgwqDCoMKgwqDCoMKgZ19mcmVlKGdlaS0m
Z3Q7b3V0LmRhdGEpOzxicj4rwqDCoMKgwqDCoMKgwqDCoGdfZnJlZShnZWktJmd0O2Vyci5kYXRh
KTs8YnI+Kzxicj7CoMKgwqDCoMKgwqDCoMKgwqBRVEFJTFFfUkVNT1ZFKCZhbXA7Z3Vlc3RfZXhl
Y19zdGF0ZS5wcm9jZXNzZXMswqBnZWkswqBuZXh0KTs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgZ19m
cmVlKGdlaSk7PGJyPsKgwqDCoMKgwqB9PGJyPi0twqANCjxicj4xLjguMy4xPGJyPjwvYmxvY2tx
dW90ZT48L2Rpdj48YnIgY2xlYXI9ImFsbCI+PGJyPi0tIDxicj48ZGl2IGRpcj0ibHRyIiBjbGFz
cz0iZ21haWxfc2lnbmF0dXJlIj5NYXJjLUFuZHLDqSBMdXJlYXU8YnI+PC9kaXY+PC9kaXY+DQo=
--000000000000e845f205c5fc2d4e--

